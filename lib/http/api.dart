class Api {
  /// 获取验证码
  static const String sendLoginCheckCode = "/sendLoginCheckCode";

  ///登录接口
  static const String login = "/login";

  ///获取商户信息
  static const String merchantInfo = "/system/user/info";

  ///获取商户今天收支信息
  static const String merchantNowBill = '/merchant/nowBill';

  ///获取商户指定日期账目明细列表
  static const String merchantPayRecordList = '/merchant/payRecord/list';

  ///获取指定日期收入支出信息
  static const String merchantListStatistic = '/merchant/listStatistic';

  ///获取指定月份收入支出信息
  static const String merchantExpenditureStatistics =
      '/merchant/expenditureStatistics';

  ///获取指定月份收入支出柱状图信息
  static const String merchantBrightnessContrast =
      '/merchant/brightnessContrast';

  ///获取收入总额
  static const String cumulativeIncome = '/merchant/cumulativeIncome';

  ///首页轮播图
  static const String homeBanner = '/pub/app/advertisement/list?location=2';

  ///支付二维码
  static const String payCode = '/merchant/detailById';

  ///保存活动标语
  static const String merchantSave = '/merchant/save';

  ///查询活动标语
  static const String merchantDetailById = '/merchant/detailById';

  ///优惠券列表查询
  static const String merchantVoucherList = '/merchant/voucher/list';

  ///评论回复查询
  static const String merchantCommentList = '/merchant/comment/list';

  ///待核销详情
  static const String merchantDoConfirmInfo = '/merchantApi/doConfirm/info';

  ///确认核销
  static const String merchantApiDoConfirm = '/merchantApi/doConfirm/doConfirm';

  ///修改平台券
  static const String platformVoucherConfigUpdate =
      '/platformVoucherConfig/update';

  ///保存评论
  static const String saveCommentMerchantComment =
      '/merchant/comment/saveCommentMerchant';

  ///修改密码
  static const String resetPwd = '/system/user/resetPwd';

  ///待发货/已发货列表
  static const String deliverList = '/backendApi/order/deliverList';

  ///确认发货
  static const String confirmDelivered = '/backendApi/order/delivered';

  ///获取订单详情
  static const String getOrderDetails = '/backendApi/order/info';

  ///二维码信息
  static const String getQrCode = '/merchantApi/merchant/merchantInfo';
}
