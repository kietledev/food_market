import 'package:flutter/material.dart';
import 'package:food_market/components/custom_surfix_icon.dart';
import 'package:food_market/components/default_button.dart';
import 'package:food_market/helpers/size_config.dart';
import 'package:food_market/ui/comple_proflie/comple_profile_ui.dart';

import '../../../helpers/constants.dart';

class SignupForm extends StatelessWidget {
  static TextEditingController textControllerEmail = TextEditingController();
  static TextEditingController textControllerPassword = TextEditingController();
  static TextEditingController textControllerConfirmPassword =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompleteProfileUI(
                      emailSignup: textControllerEmail.text,
                      passwordSignup: textControllerPassword.text,
                    ),
                  ),
                );
                // Navigator.pushNamed(context, CompleteProfileUI.routeName);
                // Navigator.push(context, CompleteProfileUI())
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: textControllerEmail,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomCupertinoIcons(icon: Icons.email),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: textControllerPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if (value.length < 8) {
          return kShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomCupertinoIcons(icon: Icons.lock),
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      controller: textControllerConfirmPassword,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return kPassNullError;
        } else if (value.length < 8) {
          return kShortPassError;
        } else if (value.length >= 8 && value != textControllerPassword.text) {
          return kMatchPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomCupertinoIcons(icon: Icons.lock),
      ),
    );
  }
}
