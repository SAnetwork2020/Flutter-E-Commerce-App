import 'package:flutter/material.dart';
import 'package:oniyeye/constants.dart';
import 'package:oniyeye/size_config.dart';

import 'complete_profile_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
        child:Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight! * 0.02,),
                Text("Complete Profile", style: headingStyle,),
                const Text("Complete your profile or complete \nwith social media",
                  textAlign: TextAlign.center,),
                SizedBox(height: SizeConfig.screenHeight! * 0.05,),
                const CompleteProfileForm(),
                SizedBox(height: getProportionateScreenHeight(30),),
                const Text("By continuing you confirm that you agree \nwith our Terms & Conditions", textAlign: TextAlign.center,)
              ],
            ),
          ),
        ) 
      );
  }
}

