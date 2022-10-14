import 'package:flutter/material.dart';
import 'package:oniyeye/screens/home_screen/components/searchField.dart';

import '../../../size_config.dart';
import '../../cart/cart_screen.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const searchField(),
            IconBtnWithCounter(
              svgSrc: "assets/icons/Cart Icon.svg",
              press: ()=>Navigator.pushNamed(context, CartScreen.routeName),
            ),
            IconBtnWithCounter(
              svgSrc: "assets/icons/Bell.svg",
              numOfItems: 3,
              press: () {  },
            ),
          ],
        )
    );
  }
}