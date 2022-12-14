import 'package:flutter/material.dart';
import 'package:oniyeye/constants.dart';
import 'package:oniyeye/size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.05,),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              const Text("We sent your code tto +234 9020 375 ***"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight! * 0.15,),
              const OtpForm(),
              SizedBox(height: SizeConfig.screenHeight! * 0.1,),
              GestureDetector(
                onTap: (){},
                child: const Text("Resend OTP Code",
                style: TextStyle(decoration: TextDecoration.underline),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expire in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(color: kPrimaryColor),
          ),
          onEnd: () {},
        ),
      ],
    );
  }
}

