import 'package:flutter/material.dart';

import 'components/body.dart';

class LoginSuccess extends StatelessWidget {
  static String routeName = "/Login Successful";
  const LoginSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Login Success"),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
