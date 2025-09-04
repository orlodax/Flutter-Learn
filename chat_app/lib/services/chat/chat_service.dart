import 'package:chat_app/models/message.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _authService = AuthService();

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore
        .collection('users')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<void> sendMessage(String receiverId, String text) async {
    final String? currentUserId = _authService.currentUser?.uid;
    final String? currentUserEmail = _authService.currentUser?.email;

    Message newMessage = Message(
      text: text,
      senderId: currentUserId ?? '',
      senderEmail: currentUserEmail ?? '',
      receiverId: receiverId,
      timestamp: Timestamp.now(),
    );

    String chatRoomId = _getChatRoomId(
      newMessage.senderId,
      newMessage.receiverId,
    );

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessagesStream(String userId, String otherUserId) {
    String chatRoomId = _getChatRoomId(userId, otherUserId);

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  String _getChatRoomId(String userId1, String userId2) {
    List<String> ids = [userId1, userId2];
    ids.sort();
    return ids.join('_');
  }
}
