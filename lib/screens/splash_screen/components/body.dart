import 'package:flutter/material.dart';
import 'package:oniyeye/components/default_button.dart';
import 'package:oniyeye/constants.dart';
import 'package:oniyeye/screens/sign_in/sign_in_screen.dart';
import 'package:oniyeye/screens/splash_screen/components/splash_contents.dart';
import 'package:oniyeye/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  final List<Map<String,String>>splashData = [
    {
      "text":"Welcome to BayWatch, Check around!",
      "image":"assets/images/splash_1.png"
    },
    {
      "text":"We help people connect with store \naround Africa",
      "image":"assets/images/splash_2.png"
    },
    {
      "text":"We show the easy way to shop online. \nJust stay at home with us",
      "image":"assets/images/splash_3.png"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
                child: PageView.builder(
                  onPageChanged: (value)=>setState(() {
                    currentPage = value;
                  }),
                  itemCount: splashData.length,
                  itemBuilder: (BuildContext context, int index)=>SplashContent(
                      text: "${splashData[index]['text']}",
                      image: "${splashData[index]['image']}",
                ),
            ),
            ),
          Expanded(
              flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      const Spacer(),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(splashData.length, (index) => buildDot(index: index)),
                      ),
                      const Spacer(flex: 3,),
                      DefaultButton(press: () {
                        Navigator.pushNamed(context, SignInScreen.routeName);}, text: "Continue",),
                      const Spacer(),
                    ]
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    width: currentPage == index? 20 : 6, height: 6,
                    decoration: BoxDecoration(
                      color: currentPage == index ? kPrimaryColor : const Color(0xffD8D8D8),
                      borderRadius: BorderRadius.circular(3)
                    ), duration: kAnimationDuration,
                  );
  }
}




