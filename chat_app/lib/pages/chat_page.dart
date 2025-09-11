import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;
  final String receiverId;

  const ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverId,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  FocusNode myFocusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 500), () => _scrollDown());
      }
    });

    Future.delayed(const Duration(milliseconds: 500), () => _scrollDown());
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(widget.receiverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(child: _buildMessagesList()),
            _buildUserInput(),
          ],
        ),
      ),
    );
  }

  void sendMessage() async {
    final String messageText = _messageController.text.trim();
    if (messageText.isEmpty) return;

    await _chatService.sendMessage(widget.receiverId, messageText);

    _messageController.clear();

    _scrollDown();
  }

  Widget _buildMessagesList() {
    String senderId = _authService.currentUser?.uid ?? '';
    return StreamBuilder(
      stream: _chatService.getMessagesStream(senderId, widget.receiverId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        return ListView(
          controller: _scrollController,
          children:
              snapshot.data?.docs
                  .map((doc) => _buildMessageItem(doc))
                  .toList() ??
              [],
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderId'] == _authService.currentUser?.uid;

    return Container(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ChatBubble(
        message: data['text'] ?? '',
        isCurrentUser: isCurrentUser,
      ),
    );
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: MyTextField(
            controller: _messageController,
            hintText: 'Type a message',
            focusNode: myFocusNode,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          margin: const EdgeInsets.only(left: 25.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_upward_rounded),
            onPressed: sendMessage,
          ),
        ),
      ],
    );
  }
}
