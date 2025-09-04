import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String text;
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final Timestamp timestamp;

  Message({
    required this.text,
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.timestamp,
  });

  // factory Message.fromMap(Map<String, dynamic> map, String documentId) {
  //   return Message(
  //     id: documentId,
  //     text: map['text'] ?? '',
  //     senderId: map['senderId'] ?? '',
  //     timestamp: (map['timestamp'] as Timestamp).toDate(),
  //   );
  // }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'timestamp': timestamp,
    };
  }
}
