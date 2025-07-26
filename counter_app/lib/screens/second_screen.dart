import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Handle button press
            Navigator.popAndPushNamed(context, '/first');
          },
          child: const Text('Go Back to First Page'),
        ),
      ),
    );
  }
}