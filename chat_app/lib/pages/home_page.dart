import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/components/user_tile.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer: MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final users = snapshot.data ?? [];
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return _buildUserListItem(users[index], context);
          },
        );
      },
    );
  }

  Widget _buildUserListItem(Map<String, dynamic> user, BuildContext context) {
    if (user['email'] == _authService.currentUser?.email) {
      return const SizedBox.shrink(); // Don't show the current user
    }

    return UserTile(
      text: user['email'] ?? 'No Email',
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ChatPage(receiverEmail: user['email'], receiverId: user['uid']),
          ),
        );
      },
    );
  }
}
