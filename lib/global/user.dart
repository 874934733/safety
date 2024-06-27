import 'package:safety/constants/constants.dart';
import 'package:safety/util/sp_util.dart';

class User {
  static User? _instance;

  factory User() => _getInstance();

  User._internal();

  static User _getInstance() {
    _instance ??= User._internal();
    return _instance!;
  }

  ///接口请求token
  String token = '';

  void saveToken(String value) {
    token = value;
    SpUtil.putStr(Constant.token, value);
  }

  String getToken() {
    SpUtil.getStr(Constant.token).then((value) {
      if (value != null) {
        token = value;
      }
    });
    return token;
  }

  ///用户名
  String userName = '';

  void saveUserName(String value) {
    userName = value;
    SpUtil.putStr(Constant.userName, value);
  }

  String getUserName() {
    SpUtil.getStr(Constant.userName).then((value) {
      if (value != null) {
        userName = value;
      }
    });
    return userName;
  }

  ///用户手机号
  String phone = '';

  void savePhone(String value) {
    phone = value;
    SpUtil.putStr(Constant.phone, value);
  }

  String getPhone() {
    SpUtil.getStr(Constant.phone).then((value) {
      if (value != null) {
        phone = value;
      }
    });
    return phone;
  }

  ///用户密码
  String pwd = '';

  void savePwd(String value) {
    pwd = value;
    SpUtil.putStr(Constant.pwd, value);
  }

  String getPwd() {
    SpUtil.getStr(Constant.pwd).then((value) {
      if (value != null) {
        pwd = value;
      }
    });
    return pwd;
  }

  ///用户名
  String userId = '';

  void saveUserId(String value) {
    userId = value;
    SpUtil.putStr(Constant.userId, value);
  }

  String getUserId() {
    SpUtil.getStr(Constant.userId).then((value) {
      if (value != null) {
        userId = value;
      }
    });
    return userId;
  }

  ///隐私协议状态
  String agreement = '';

  void saveAgreement(String value) {
    agreement = value;
    SpUtil.putStr(Constant.agreement, value);
  }

  String getAgreement() {
    SpUtil.getStr(Constant.agreement).then((value) {
      if (value != null) {
        agreement = value;
      }
    });
    return agreement;
  }

  void clearUserInfo() {
    SpUtil.putStr(Constant.token, '');
    SpUtil.putStr(Constant.phone, '');
    SpUtil.putStr(Constant.pwd, '');
    SpUtil.putStr(Constant.userId, '');
    SpUtil.putStr(Constant.auditStatus, '');
    token = '';
    phone = '';
  }
}
