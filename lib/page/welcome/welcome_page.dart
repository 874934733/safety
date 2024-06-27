import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:safety/page/login/login_page.dart';
import 'package:safety/util/navigator_util.dart';

///欢迎页
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _remainingSeconds = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: [
      Image.asset(
        "assets/images/icon_welcome_page.png",
        width: size.width,
        fit: BoxFit.fill, // 完全填充
        height: size.height,
      ),
      Container(
          margin: EdgeInsets.only(
              top: size.height * 0.35,
              bottom: size.height * 0.13,
              left: 20,
              right: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AutoSizeText(
                    '安全第一',
                    maxFontSize: 18,
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  AutoSizeText(
                    '预防为主',
                    maxFontSize: 18,
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AutoSizeText(
                    '以人为本',
                    maxFontSize: 18,
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  AutoSizeText(
                    '全员参与',
                    maxFontSize: 18,
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AutoSizeText('科学发展',
                      maxFontSize: 18,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none)),
                  SizedBox(
                    width: 30,
                  ),
                  AutoSizeText('持续改进',
                      maxFontSize: 18,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  "assets/images/icon_company_logo.png",
                  width: size.width,
                  fit: BoxFit.fitWidth, // 完全填充
                ),
              ))
            ],
          )),
      Container(
        width: size.width,
        alignment: Alignment.topRight,
        margin: const EdgeInsets.only(top: 45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '$_remainingSeconds秒',
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: skipCountdown,
              child: const Text(
                '跳过',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      )
    ]));
  }

  void startCountdown() async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 1) {
          _remainingSeconds--;
        } else {
          timer.cancel();
          NavigatorUtil.pushAndRemoveUntil(context, const LoginPage());
        }
      });
    });
  }

  void skipCountdown() async {
    _timer.cancel();
    NavigatorUtil.pushAndRemoveUntil(context, const LoginPage());
  }
}
