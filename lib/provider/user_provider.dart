import 'package:flutter/foundation.dart';
import 'package:safety/global/user.dart';

class UserInfo with ChangeNotifier {
  UserInfo._internal();

  static final UserInfo _singleton = UserInfo._internal();

  factory UserInfo() => _singleton;

  ///接口请求_token
  String _token = '';

  String get token => _token;

  set setToken(String value) {
    _token = value;
    saveToken(value);
  }

  void saveToken(String value) {
    _token = value;
    User().saveToken(value);
  }

  ///用户名
  String _userName = '';

  String get userName => _userName;

  set setuserName(String value) {
    _userName = value;
    saveUserName(value);
  }

  void saveUserName(String value) {
    _userName = value;
    User().saveUserName(value);
  }

  void getUserName() {
    _userName = User().getUserName();
  }

  ///用户手机号码
  String _phone = '';

  String get phone => _phone;

  set setPhone(String value) {
    _phone = value;
    savePhone(value);
  }

  void savePhone(String value) {
    _phone = value;
    User().savePhone(value);
  }

  void getPhone() {
    _phone = User().getPhone();
  }

  ///用户id
  String _userId = '';

  String get userId => _userId;

  set setUserId(String value) {
    _userId = value;
    saveUserId(value);
  }

  void saveUserId(String value) {
    _userId = value;
    User().saveUserId(value);
  }

  ///用户协议状态 1同意 2拒绝
  String _agreement = '';

  String get agreement => _agreement;

  set setAgreement(String value) {
    _agreement = value;
    saveAgreement(value);
  }

  void saveAgreement(String value) {
    _agreement = value;
    User().saveAgreement(value);
  }

  void loadUserInfo() {
    _token = User().getToken();

    _phone = User().getPhone();

    _userId = User().getUserId();

    _agreement = User().getAgreement();

    notifyListeners();
  }

  void loginOut() {
    _token = '';

    _phone = '';

    _userId = '';

    User().clearUserInfo();

    notifyListeners();
  }

  void clearUserInfo() {
    saveToken('');
    saveUserId('');
    saveUserName('');
  }
}
