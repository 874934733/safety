import 'dart:async';

import 'package:flutter/material.dart';

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
    return Stack(children: [
      Image.asset(
        "assets/images/icon_welcome_page.png",
        width: size.width,
        fit: BoxFit.fill, // 完全填充
        height: size.height,
      ),
     Container(
       margin: EdgeInsets.only(top: size.height*0.35, bottom: size.height*0.13, left: 20, right: 20),
       child: Column(
         children: [
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: const [
               Text('安全第一',  style: TextStyle(color: Colors.white, fontSize: 18, decoration: TextDecoration.none),),
               SizedBox(width: 30,),
               Text('预防为主',  style: TextStyle(color: Colors.white, fontSize: 18, decoration: TextDecoration.none),),
             ],
           ),
           const SizedBox(height: 20,),
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: const [
               Text('以人为本',  style: TextStyle(color: Colors.white, fontSize: 18, decoration: TextDecoration.none),),
               SizedBox(width: 30,),
               Text('全员参与',  style: TextStyle(color: Colors.white, fontSize: 18, decoration: TextDecoration.none),),
             ],
           ),
           const SizedBox(height: 20,),
           Row(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: const [
               Text('科学发展',  style: TextStyle(color: Colors.white, fontSize: 18, decoration: TextDecoration.none),),
               SizedBox(width: 30,),
               Text('持续改进',  style: TextStyle(color: Colors.white, fontSize: 18, decoration: TextDecoration.none),),
             ],
           ),
           Expanded(child:
           Align(
             alignment: Alignment.bottomCenter,
             child:  Image.asset(
               "assets/images/icon_company_logo.png",
               width: size.width,
               fit: BoxFit.fitWidth, // 完全填充
             ),
           ))

         ],
       )
     ),

    ]);
  }

  void startCountdown() async{
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingSeconds > 0) {
          _remainingSeconds--;
        } else {
          timer.cancel();

        }
      });
    });
  }

  void skipCountdown() async{
    _timer.cancel();
  }

}