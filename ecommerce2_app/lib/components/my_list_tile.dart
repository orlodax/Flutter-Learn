import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const MyListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        title: Text(text),
        leading: Icon(icon, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
