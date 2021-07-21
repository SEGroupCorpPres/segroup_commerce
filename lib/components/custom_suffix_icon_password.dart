import 'package:flutter/material.dart';

import '../size_config.dart';

class CustomSuffixIconPassword extends StatelessWidget {
  const CustomSuffixIconPassword({
    Key key,
    this.icon,
  }) : super(key: key);
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: Icon(
        Icons.lock_outlined,
      ),
    );
  }
}
