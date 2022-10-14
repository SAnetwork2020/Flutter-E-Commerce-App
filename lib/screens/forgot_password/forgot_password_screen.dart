import 'package:flutter/material.dart';

import 'components/body.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = "/Forgot Password";
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        elevation: 0,
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
