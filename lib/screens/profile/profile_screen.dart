import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oniyeye/enums.dart';
import 'package:oniyeye/screens/home_screen/home_screen.dart';
import 'package:oniyeye/screens/profile/components/body.dart';

import '../../components/custom_bottom_nav_bar.dart';
import '../../constants.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/Profile Screen";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavbar(selectedMenu: MenuState.profile,),
    );
  }
}


