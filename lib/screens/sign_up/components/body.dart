import 'package:flutter/material.dart';
import 'package:segroup_commerce/components/custom_suffix_icon.dart';
import 'package:segroup_commerce/components/custom_suffix_icon_password.dart';
import 'package:segroup_commerce/components/default_button.dart';
import 'package:segroup_commerce/components/form_error.dart';
import 'package:segroup_commerce/constants.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text(
              'Register Account',
              style: headingStyle,
            ),
            Text(
              'Complete your details or continue \nwith social media',
              textAlign: TextAlign.center,
            ),
            SignUpFormState(),
          ],
        ),
      ),
    );
  }
}

class SignUpFormState extends StatefulWidget {
  @override
  _SignUpFormStateState createState() => _SignUpFormStateState();
}

class _SignUpFormStateState extends State<SignUpFormState> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirm_password;
  final List<String> errors = [];
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        buildEmailFormField(),
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        buildPasswordFormField(),
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        buildConfirmPasswordFormField(),
        FormError(errors: errors,),
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        DefaultButton(
          key: _formKey,
          text: 'Continue', 
          press: () {
            if(_formKey.currentState.validate()){

            }
          },
        ),
      ],
    ));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return '';
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
          password = value;
          return '';
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return '';
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIconPassword(),
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (password == confirm_password) {
          removeError(error: kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return '';
        } else if (password != confirm_password) {
          addError(error: kMatchPassError);
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Re-enter your password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIconPassword(),
      ),
    );
  }
}
