import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/users_model.dart';
import 'shared_prefs.dart';

final userProvider = ChangeNotifierProvider((ref) {
  return UserProvider();
});

class UserProvider with ChangeNotifier {
  UsersModel? _user = SharedPrefs.user;

  UsersModel? get user => _user;

  set setUser(UsersModel? value) {
    _user = value;
    SharedPrefs.user = value;
    // log('user: --<   >-- :user');
    // log(_user.toString());
    notifyListeners();
  }
}
