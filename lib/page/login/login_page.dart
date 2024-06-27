import 'package:flutter/material.dart';

///登录页
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Container(
            child:  Image.asset(
              "assets/images/icon_login_logo.png",
              width: 53,
              fit: BoxFit.fill, // 完全填充
              height: 53,
            ),
          )
        ],
      ),
    );
  }
  
}