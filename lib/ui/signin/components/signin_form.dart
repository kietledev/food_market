import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_market/bloc/signin_bloc/signin_bloc.dart';
import 'package:food_market/components/componets.dart';
import 'package:food_market/components/custom_surfix_icon.dart';
import 'package:food_market/components/default_button.dart';
import 'package:food_market/helpers/size_config.dart';
import 'package:food_market/ui/tab_bar/tab_bar_ui.dart';
import '../../../helpers/constants.dart';

class SigninForm extends StatelessWidget {
  static TextEditingController textControllerEmail = TextEditingController();
  static TextEditingController textControllerPassword = TextEditingController();
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SigninBloc bloc = BlocProvider.of<SigninBloc>(context);
    bool remember = false;

    return BlocListener<SigninBloc, SigninState>(
      listener: (context, state) {
        if (state is SigninLoadingState) {
          showViewLoading(context);
        } else if (state is SigninSuccessState) {
          hideViewLoading(context);
          Navigator.pushNamed(context, TabBarUI.routeName);
        } else if (state is SigninErrorState) {
          hideViewLoading(context);
          showOKAlertDialog('Error', state.error!, context);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              children: [
                BlocBuilder(
                  bloc: bloc,
                  builder: (context, SigninState state) {
                    if (state is RemembeState) {
                      remember = true;
                    } else if (state is DontRemembeState) {
                      remember = false;
                    }
                    return Row(children: [
                      Checkbox(
                        value: remember,
                        activeColor: kPrimaryColor,
                        onChanged: (value) {
                          if (value!) {
                            bloc.add(RememberEvent());
                          } else {
                            bloc.add(DontRememberEvent());
                          }
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          if (remember) {
                            bloc.add(DontRememberEvent());
                          } else {
                            bloc.add(RememberEvent());
                          }
                        },
                        child: Text("Remember me"),
                      ),
                    ]);
                  },
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, ForgotPasswordUI.routeName);
                  },
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  // _formKey.currentState!.save();
                  onSignin(remember, bloc, context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  onSignin(bool remember, SigninBloc bloc, BuildContext context) {
    Map<String, String> body = {
      'email': textControllerEmail.text,
      'password': textControllerPassword.text,
    };
    bloc.add(SigninStartEvent(body: jsonEncode(body), remember: remember));
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
}
