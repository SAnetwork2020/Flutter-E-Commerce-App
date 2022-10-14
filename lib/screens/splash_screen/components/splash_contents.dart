import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text('BayWatch',style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize:getProportionateScreenWidth(36)),),
        Text(text,textAlign: TextAlign.center,),
        const Spacer(flex: 2,),
        Image.asset(image,
          width: getProportionateScreenWidth(265),
          height: getProportionateScreenHeight(235),
        )
      ],
    );
  }
}