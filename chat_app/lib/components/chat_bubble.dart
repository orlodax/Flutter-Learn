import 'package:chat_app/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isCurrentUser
            ? (isDarkMode ? Colors.green[600] : Colors.grey.shade500)
            : (isDarkMode ? Colors.grey[800] : Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        message,
        style: TextStyle(
          color: isCurrentUser
              ? Colors.white
              : (isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
