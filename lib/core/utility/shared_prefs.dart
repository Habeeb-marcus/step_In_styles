import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:step_in_style/core/utility/constants.dart';

import '../../models/users_model.dart';

class SharedPrefs {
  static SharedPreferences? _prefs;

  Future<void> initSharedPrefs() async =>
      _prefs ??= await SharedPreferences.getInstance();

  static set user(UsersModel? value) =>
      _prefs?.setString(Constants.kUser, jsonEncode(value?.toJson()));

  UsersModel? get _user {
    try {
      final result = _prefs?.getString(Constants.kUser);
      if (result == null) return null;
      return UsersModel.fromJson(jsonDecode(result));
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static UsersModel? get user => SharedPrefs()._user;

  static void clearData() async {
    await _prefs?.clear();
  }
}
