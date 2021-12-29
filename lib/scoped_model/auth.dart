import 'package:flutter/material.dart';
import 'package:hook_up_rent/utils/store.dart';
import 'package:hook_up_rent/utils/string_is_null_or_empty.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthModel extends Model {
  String _token = '';
  String get token => _token;

  bool get isList => _token is String && _token != '';
  void initApp(BuildContext context) async {
    Store store = await Store.getInstance();
    String token = store.getString(StoreKeys.token);
    if (stringIsNullOrEmpty(token)) {}
  }

  void login(String token, BuildContext context) {
    _token = token;
    notifyListeners();
  }

  void logout() {}
}
