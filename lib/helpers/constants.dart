import 'package:flutter/material.dart';
import 'package:food_market/helpers/size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final titleStyle = TextStyle(
  fontSize: getProportionateScreenWidth(15),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.2,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kFirstNamelNullError = "Please Enter your first name";
const String kMiddleNamelNullError = "Please Enter your middle name";
const String kLastNamelNullError = "Please Enter your last name";

const String kPhoneNumberNullError = "Please Enter your phone number";
const String kPhoneShortPhoneNumberError = "Phone number is too short";

const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

class URL {
  static final String URL_SERVER = "https://freeapi.code4func.com/api/v1";
  static final String API_SIGNIN = URL_SERVER + "/user/sign-in";
  static final String API_SIGNUP = URL_SERVER + "/user/sign-up";
  static final String API_GET_LIST_FOOD = URL_SERVER + "/food/list/";
}

// Offline search
// void onSearch(String value) {
//   if (value.length > 0) {
//     listFilter = items
//         .where((element) =>
//             element.toLowerCase().contains(value.toLowerCase()))
//         .toList();
//   } else {
//     listFilter = items;
//   }
// }