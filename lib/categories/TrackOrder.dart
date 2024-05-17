import 'package:flutter/material.dart';
import 'package:flutter_application_1/textfield.dart';

class OrderReceived extends StatelessWidget {
  OrderReceived({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyTextField(
              hintText: "Email",
              controller: emailController,
              prefixIcon: Icons.email_rounded,
              focusNode: _focusNode1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyTextField(
              hintText: 'Password',
              controller: passwordController,
              prefixIcon: Icons.lock,
              focusNode: _focusNode2,
            ),
          ),
        ],
      ),
    );
  }
}
