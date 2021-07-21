import 'package:flutter/widgets.dart';
import 'package:segroup_commerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:segroup_commerce/screens/login_success/login_success_screen.dart';
import 'package:segroup_commerce/screens/sign_in/sign_in_screens.dart';
import 'package:segroup_commerce/screens/sign_up/sign_up_screen.dart';
import 'package:segroup_commerce/screens/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
};
