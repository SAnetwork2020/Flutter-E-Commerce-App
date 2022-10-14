import 'package:flutter/material.dart';
import 'package:oniyeye/screens/sign_in/components/sign_form.dart';
import 'package:oniyeye/size_config.dart';

import '../../../components/no_account_text.dart';
import '../../../components/social_card.dart';


class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Welcome Back', style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold,
              ),),
              const Text('Sign In with your email and password \nor continue with social media',
                textAlign: TextAlign.center,
                ),
              SizedBox(height: SizeConfig.screenHeight! * 0.04,),
              const SignForm(),
              SizedBox(height: SizeConfig.screenHeight! * 0.08,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon:"assets/icons/google-icon.svg",
                    press: () {  },
                  ),
                  SocialCard(
                    icon:"assets/icons/twitter.svg",
                    press: () {  },
                  ),
                  SocialCard(
                    icon:"assets/icons/facebook-2.svg",
                    press: () {  },
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              const NoAccountText(),
                ],
              ),
        )
        ),
      );
  }
}




