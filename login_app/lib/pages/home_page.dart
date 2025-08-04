import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: _signUserOut, icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Text(
          'Logged in as: ${_user?.email}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void _signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
