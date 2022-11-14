import 'package:flutter/material.dart';
import 'package:oniyeye/enums.dart';
import 'package:oniyeye/screens/profile/components/body.dart';

import '../../components/custom_bottom_nav_bar.dart';

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
      body: const Body(),
      bottomNavigationBar: const CustomBottomNavbar(selectedMenu: MenuState.profile,),
    );
  }
}


