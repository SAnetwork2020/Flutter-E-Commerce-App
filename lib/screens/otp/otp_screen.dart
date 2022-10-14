import 'package:flutter/material.dart';
import 'package:oniyeye/screens/otp/components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/OTP Screen";
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
