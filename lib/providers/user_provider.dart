import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cafe_customers_app/utilities/cache_helper.dart';
import 'package:cafe_customers_app/utilities/sample_data.dart';

class UserProvider extends ChangeNotifier {
  // Define properties
  String? _name = CacheHelper.getString(key: 'name');
  String? _email = CacheHelper.getString(key: 'email');
  int? _mobile = CacheHelper.getInteger(key: 'mobile');
  final int _balance = Data.balance;
  final int _freeDrinks = Data.freeDrinks;

  // Create properties getters
  String? get name => _name;
  String? get email => _email;
  int? get mobile => _mobile;
  int? get balance => _balance;
  int? get freeDrinks => _freeDrinks;

  void setUser(

      /// Sets new user data, overwrites old data if set
      {required String newName,
      required String newEmail,
      required int newMobile}) {
    // Add to database
    // ...

    // Add to local storage
    CacheHelper.saveData(key: 'name', value: newName);
    CacheHelper.saveData(key: 'email', value: newEmail);
    CacheHelper.saveData(key: 'mobile', value: newMobile);

    _name = newName;
    _email = newEmail;
    _mobile = newMobile;

    notifyListeners();
  }

  String getUserJson() {
    Map data = {
      'name': name,
      'email': email,
      'mobile': mobile,
    };
    return jsonEncode(data);
  }

  bool checkUser() {
    /// Returns true if name, email and mobile properties are not null, else
    /// returns false
    return _name != '' && _email != '' && _mobile != 0;
  }
}
