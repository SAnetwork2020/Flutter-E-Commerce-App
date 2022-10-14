import 'package:flutter/material.dart';
import 'package:oniyeye/screens/cart/cart_screen.dart';
import 'package:oniyeye/screens/complete_profile/complete_profile_screen.dart';
import 'package:oniyeye/screens/details/details_screen.dart';
import 'package:oniyeye/screens/forgot_password/forgot_password_screen.dart';
import 'package:oniyeye/screens/home_screen/home_screen.dart';
import 'package:oniyeye/screens/login_success/login_success_screen.dart';
import 'package:oniyeye/screens/otp/otp_screen.dart';
import 'package:oniyeye/screens/profile/profile_screen.dart';
import 'package:oniyeye/screens/sign_in/sign_in_screen.dart';
import 'package:oniyeye/screens/sign_up/sign_up_screen.dart';
import 'package:oniyeye/screens/splash_screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPassword.routeName: (context) => const ForgotPassword(),
  LoginSuccess.routeName: (context) => const LoginSuccess(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfile.routeName: (context) => const CompleteProfile(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailScreen.routeName: (context) => const DetailScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
};