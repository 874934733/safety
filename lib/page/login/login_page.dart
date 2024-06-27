import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safety/provider/user_provider.dart';
import 'package:safety/util/hextocolor.dart';
import 'package:safety/util/string_util.dart';
import 'package:safety/widget/my_box_decoration.dart';

///登录页
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ///手机号输入框
  final _phoneController = TextEditingController();

  ///密码输入框
  final _pwdController = TextEditingController();

  ///密码显示隐藏
  bool showPwd = true;

  ///密码显示隐藏
  String pwdImage = 'assets/images/icon_hide_pwd.png';

  @override
  void dispose() {
    _phoneController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          'assets/images/icon_login_bg.png',
          width: size.width,
          fit: BoxFit.fill, // 完全填充
          height: 200,
        ),
        Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 74,
              height: 74,
              margin: const EdgeInsets.only(top: 80),
              decoration: myBoxDecoration(20, '#ffffff', '#ffffff'),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/icon_login_logo.png',
                width: 53,
                fit: BoxFit.fill, // 完全填充
                height: 53,
              ),
            )),
        Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.only(left: 37, right: 37, top: 25),
          margin: const EdgeInsets.only(top: 180),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            border: Border.all(width: 1, color: Colors.white),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    AutoSizeText(
                      '账号登录',
                      maxFontSize: 20,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: HexToColor('#343434')),
                    ),
                    Container(
                      width: 50,
                      height: 5,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(2.5)),
                        gradient: LinearGradient(
                          // 渐变的方向，从顶部到底部
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          // 渐变的颜色列表
                          colors: [
                            HexToColor('#3A62FF'),
                            HexToColor('#5499FE'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icon_phone.png',
                        width: 14,
                        fit: BoxFit.fill, // 完全填充
                        height: 17,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: TextField(
                              controller: _phoneController,
                              decoration: InputDecoration.collapsed(
                                  hintText: "请输入手机号",
                                  hintStyle:
                                      TextStyle(color: HexToColor('#999999'))),
                              obscureText: false,
                              onChanged: _phoneTextChange,
                              //是否是以星号*显示密码
                              style: TextStyle(
                                  fontSize: 14, color: HexToColor('#343434')))),
                    ],
                  )),
              Container(
                width: size.width,
                height: 1,
                color: HexToColor('#EEEEEE'),
              ),
              SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/icon_code.png',
                        width: 14,
                        fit: BoxFit.fill, // 完全填充
                        height: 17,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: TextField(
                              controller: _pwdController,
                              decoration: InputDecoration.collapsed(
                                  hintText: "请输入密码",
                                  hintStyle:
                                      TextStyle(color: HexToColor('#999999'))),
                              obscureText: showPwd,
                              onChanged: _pwdTextChange,
                              style: TextStyle(
                                  fontSize: 14, color: HexToColor('#343434')))),
                      Visibility(
                          visible: !StringUtil.isEmpty(_pwdController.text),
                          child: InkWell(
                              onTap: () => {_displayPwd()},
                              child: Image.asset(
                                pwdImage,
                                width: 20,
                                fit: BoxFit.fill, // 完全填充
                                height: 16,
                              ))),
                    ],
                  )),
              Container(
                width: size.width,
                height: 1,
                color: HexToColor('#EEEEEE'),
              ),
              InkWell(
                  onTap: () => {_login()},
                  child: Container(
                    width: size.width,
                    height: 45,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 60),
                    decoration: myBoxDecoration(23, '#467DFF', '#467DFF'),
                    child: const AutoSizeText(
                      '登录',
                      maxFontSize: 16,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, color: Colors.white),
                    ),
                  ))
            ],
          ),
        )
      ],
    ));
  }

  ///录入手机号码
  _phoneTextChange(String value) async {
    final userState = Provider.of<UserInfo>(context, listen: false);
    setState(() {
      userState.savePhone(value);
    });
  }

  ///密码显示隐藏判断
  _displayPwd() async {
    if (showPwd) {
      showPwd = false;
      pwdImage = 'assets/images/icon_show_pwd.png';
    } else {
      showPwd = true;
      pwdImage = 'assets/images/icon_hide_pwd.png';
    }
    setState(() {});
  }

  ///录入密码
  _pwdTextChange(String value) async {
    final userState = Provider.of<UserInfo>(context, listen: false);
    setState(() {
      userState.savePwd(value);
    });
  }

  ///登录
  _login() async {




  }
}
