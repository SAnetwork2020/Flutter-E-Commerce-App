import 'package:flutter/material.dart';

import '../../components/custom_bottom_nav_bar.dart';
import '../../enums.dart';
import '../home_screen/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/Home Screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavbar(selectedMenu: MenuState.home,),
    );
  }
}
