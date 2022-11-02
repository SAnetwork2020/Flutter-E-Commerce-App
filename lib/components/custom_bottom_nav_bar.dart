import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../enums.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/profile/profile_screen.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({
    Key? key, required this.selectedMenu,
  }) : super(key: key);
  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xffb6b6b6);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xffdadada).withOpacity(0.15)
          )
        ],
      ),
      child: SafeArea(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: ()=>Navigator.pushNamed(context, HomeScreen.routeName),
                icon: SvgPicture.asset(
                  "assets/icons/Shop Icon.svg",
                  color: MenuState.home == selectedMenu? kPrimaryColor : inActiveIconColor,
                )),
            IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  "assets/icons/Heart Icon.svg",
                  color: MenuState.favourite == selectedMenu? kPrimaryColor : inActiveIconColor,
                )),
            IconButton(
                onPressed: (){},
                icon: SvgPicture.asset(
                  "assets/icons/Chat bubble Icon.svg",
                  color: MenuState.message == selectedMenu? kPrimaryColor : inActiveIconColor,
                )),
            IconButton(
                onPressed: ()=>Navigator.pushNamed(context, ProfileScreen.routeName),
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu? kPrimaryColor : inActiveIconColor,
                )),

          ],
        ),
      ),
    );
  }
}