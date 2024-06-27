import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:safety/constants/constants.dart';
import 'package:safety/http/request_util.dart';
import 'package:safety/page/login/login_page.dart';
import 'package:safety/page/main_page/main_page.dart';
import 'package:safety/page/welcome/welcome_page.dart';
import 'package:safety/provider/user_provider.dart';

void main() async{
  const SystemUiOverlayStyle style = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark);
  SystemChrome.setSystemUIOverlayStyle(style);
  WidgetsFlutterBinding.ensureInitialized();
  // 初始化dio
  configDio(
      baseUrl: Constant.debug ? Constant.devBaseUrl : Constant.releaseBaseUrl);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<UserInfo>.value(value: UserInfo()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '安全培训教育',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(),
      routes: <String, WidgetBuilder>{
        '/WelcomePage': (context) => const WelcomePage(),
        '/MainPage': (context) => const MainPage(),
        '/LoginPage': (context) => const LoginPage(),
      }
    );
  }
}
