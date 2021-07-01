import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static final String SIGNUP_EMAIL_PREFERENCE = 'SIGNUP_EMAIL_PREFERENCE';
  static final String SIGNUP_PASSWORD_PREFERENCE = 'SIGNUP_PASSWORD_PREFERENCE';
  static final String TOKEN_PREFERENCE = 'TOKEN_PREFERENCE';

  static final Preferences preferences = Preferences();

  get(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? '';
    // return json.decode(prefs.getString(key) ?? '');
  }

  set(String key, value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, json.encode(value));
  }

  remove(String key) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key);
  }

  clear() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }

  getToken() async {
    return await preferences.get(TOKEN_PREFERENCE);
  }

  setToken(String value) {
    preferences.set(TOKEN_PREFERENCE, value);
  }

  getSignUpEmail() async {
    return await preferences.get(SIGNUP_EMAIL_PREFERENCE);
  }

  setSignUpEmail(String value) async {
    preferences.set(SIGNUP_EMAIL_PREFERENCE, value);
  }

  getSignUpPassword() async {
    return preferences.get(SIGNUP_EMAIL_PREFERENCE);
  }

  setSignUpPassword(String value) async {
    preferences.set(SIGNUP_PASSWORD_PREFERENCE, value);
  }

  /* Example get in ui */
  // getTokenInUI() async {
  //   final pref = Preferences();
  //   var a = await pref.getToken();
  //   print(a);
  //   return a;
  // }
  /* Exxample set in ui */
  // final Preferences pref = Preferences();
  // pref.setToken(userModel.token);
}
