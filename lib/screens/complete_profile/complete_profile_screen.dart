import 'package:flutter/material.dart';
import '../complete_profile/components/body.dart';

class CompleteProfile extends StatelessWidget {
  static String routeName = "/Complete Profile";
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complete Profile"),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
