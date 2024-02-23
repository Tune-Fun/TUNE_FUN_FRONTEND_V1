import 'package:flutter/material.dart';
import 'package:tunefun_front/constants/constants.dart';

class SignupPasswordScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;

  const SignupPasswordScreen({
    super.key,
    required this.emailController,
    required this.usernameController,
  });

  @override
  State<SignupPasswordScreen> createState() => _SignupPasswordScreenState();
}

class _SignupPasswordScreenState extends State<SignupPasswordScreen> {
  final appbar = UIConstants.appBar();
  late String email;
  late String username;

  @override
  void initState() {
    super.initState();
    email = widget.emailController.text;
    username = widget.usernameController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Column(
        children: [
          Text(email),
          Text(username),
        ],
      ),
    );
  }
}
