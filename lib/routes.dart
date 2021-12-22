import 'package:flutter/material.dart';
import 'package:flutter_exommerce/screens/add_cart/addCartScreen.dart';
import 'package:flutter_exommerce/screens/cart/cart_screen.dart';
import 'package:flutter_exommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter_exommerce/screens/details/details_screen.dart';
import 'package:flutter_exommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_exommerce/screens/home/home_screen.dart';
import 'package:flutter_exommerce/screens/login_success/login_success_screen.dart';
import 'package:flutter_exommerce/screens/otp/otp_screen.dart';
import 'package:flutter_exommerce/screens/profile/profile_screen.dart';
import 'package:flutter_exommerce/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_exommerce/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_exommerce/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (ctx) => SplashScreen(),
  SignIn.routeName: (ctx) => SignIn(),
  ForgotPassword.rotuteName: (ctx) => ForgotPassword(),
  LoginSuccess.rotuteName: (ctx) => LoginSuccess(),
  SignUp.routeName: (ctx) => SignUp(),
  CompleteProfile.routeName: (ctx) => CompleteProfile(),
  OtpScreen.routeNmae: (ctx) => OtpScreen(),
  HomeScreen.routeName: (ctx) => HomeScreen(),
  DetailsScreen.routeName: (ctx) => DetailsScreen(),
  CartScreen.routeName: (ctx) => CartScreen(),
  ProfileScreen.routeName: (ctx) => ProfileScreen(),
  AddProductScreen.routeName: (ctx) => AddProductScreen(),
};
