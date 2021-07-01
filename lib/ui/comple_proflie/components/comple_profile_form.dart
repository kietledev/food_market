import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_market/bloc/signup_bloc/signup_bloc.dart';
import 'package:food_market/components/componets.dart';
import 'package:food_market/components/custom_surfix_icon.dart';
import 'package:food_market/components/default_button.dart';
import 'package:food_market/helpers/size_config.dart';
import 'package:food_market/ui/comple_proflie/comple_profile_ui.dart';
import 'package:food_market/ui/signin/signin_ui.dart';
import '../../../helpers/constants.dart';

class CompleteProfileForm extends StatelessWidget {
  static TextEditingController textControllerFirstName =
      TextEditingController();
  static TextEditingController textControllerMiddleName =
      TextEditingController();
  static TextEditingController textControllerLastName = TextEditingController();
  static TextEditingController textControllerPhoneNumber =
      TextEditingController();
  static TextEditingController textControllerAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final SignupBloc bloc = BlocProvider.of<SignupBloc>(context);
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is SignupLoadingState) {
          showViewLoading(context);
        } else if (state is SignupSuccessState) {
          hideViewLoading(context);
          Navigator.of(context).pushNamedAndRemoveUntil(
              SigninUI.routeName, (Route<dynamic> route) => false);
        } else if (state is SignupErrorState) {
          hideViewLoading(context);
          showOKAlertDialog('Error', state.error!, context);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            buildFirstNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildMiddleNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildLastNameFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPhoneNumberFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildAddressFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  onSignup(bloc, context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  onSignup(SignupBloc bloc, BuildContext context) {
    Map<String, String> body = {
      'email': (CompleteProfileInherited.of(context)!.emailSignup).toString(),
      'password':
          (CompleteProfileInherited.of(context)!.passwordSignup).toString(),
      'fullName': getFullName(textControllerFirstName.text,
          textControllerMiddleName.text, textControllerLastName.text),
      'phone': textControllerPhoneNumber.text,
      'address': textControllerAddress.text,
    };
    bloc.add(SignupStartEvent(body: jsonEncode(body)));
  }

  String getFullName(String first, String middle, String last) {
    if (middle.isEmpty) {
      return '$last $first';
    } else {
      return '$last $middle $first';
    }
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: textControllerFirstName,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return kFirstNamelNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomCupertinoIcons(
          icon: Icons.person_outline,
        ),
      ),
    );
  }

  TextFormField buildMiddleNameFormField() {
    return TextFormField(
      controller: textControllerMiddleName,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Middle Name",
        hintText: "Enter your middle name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomCupertinoIcons(
          icon: Icons.person_outline,
        ),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: textControllerLastName,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return kLastNamelNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomCupertinoIcons(
          icon: Icons.person_outline,
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: textControllerPhoneNumber,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return kPhoneNumberNullError;
        } else if (value.length < 10) {
          return kPhoneShortPhoneNumberError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomCupertinoIcons(
          icon: Icons.phone_outlined,
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: textControllerAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.streetAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return kAddressNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomCupertinoIcons(
          icon: Icons.location_on_outlined,
        ),
      ),
    );
  }
}
