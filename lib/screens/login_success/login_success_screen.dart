import 'package:flutter/material.dart';
import 'package:segroup_commerce/screens/login_success/components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = '/login_success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(
          'Login Succes',
        ),
      ),
      body: Body(),
    );
  }
}
