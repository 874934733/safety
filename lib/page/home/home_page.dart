import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safety/page/home/course/course_page.dart';
import 'package:safety/page/home/main/main_page.dart';
import 'package:safety/page/home/my/my_page.dart';
import 'package:safety/page/home/task/task_page.dart';
import 'package:safety/util/hextocolor.dart';

///欢迎页
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const <Widget>[
    MainPage(),
    CoursePage(),
    TaskPage(),
    MyPage(),
  ];

  // 分别定义选中和未选中的图标路径
  final Map<int, String> _unselectedIcons = {
    0: 'assets/images/icon_tab_one_black.png',
    1: 'assets/images/icon_tab_two_black.png',
    2: 'assets/images/icon_tab_three_black.png',
    3: 'assets/images/icon_tab_four_black.png',
  };

  final Map<int, String> _selectedIcons = {
    0: 'assets/images/icon_tab_one_blue.png',
    1: 'assets/images/icon_tab_two_blue.png',
    2: 'assets/images/icon_tab_three_blue.png',
    3: 'assets/images/icon_tab_four_blue.png',
  };

  final List<String> _pagesTitle = <String>[
    '首页',
    '课程',
    '任务',
    '我的',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: List.generate(_unselectedIcons.length, (index) {
          // 根据选中状态动态选择图标路径
          final iconPath = _selectedIndex == index
              ? _selectedIcons[index]!
              : _unselectedIcons[index]!;
          return BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(iconPath)),
            label: _pagesTitle[index], // 如果不需要显示文字，可以留空
          );
        }),
        currentIndex: _selectedIndex,
        selectedItemColor: HexToColor('#467DFF'),
        unselectedItemColor: Colors.black,
        selectedFontSize: 9,
        unselectedFontSize: 9,
        onTap: _onItemTapped,
      ),
    );
  }
}
