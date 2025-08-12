import 'package:flutter/material.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: _togglePage);
    } else {
      return RegisterPage(onTap: _togglePage);
    }
  }

  void _togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
}
