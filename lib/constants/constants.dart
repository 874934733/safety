class Constant {
  static bool debug = false;

  static const String devBaseUrl = "https://meishenghuo.yingyang211.com:7777";

  static const String releaseBaseUrl = "https://meishenghuo.yingyang211.com:7777";

  static const String devWebSocketUrl = 'ws://39.98.54.139:7777/ws/payVoice/m';

  static const String releaseWebSocketUrl =
      'ws://39.98.54.139:7777//ws/payVoice/m';

  static const String successCode = '200';

  static const String invalidateToken = '403';

  static const String otherError = '-9999';

  /// 用户名
  static const String userName = 'userName';

  /// 用户手机号码
  static const String phone = 'phone';

  /// 请求token
  static const String token = 'token';

  ///用户id
  static const String userId = 'userId';

  ///商户审核状态
  static const String auditStatus = 'auditStatus';

  ///用户协议状态 1同意 2拒绝
  static const String agreement = 'agreement';

  ///隐私协议地址
  static const String privacyAgreement =
      'https://meishenghuo.yingyang211.com:8088/privacyPolicy/index.html';
}
