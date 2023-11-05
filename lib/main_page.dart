import 'package:demo/home_page.dart';
import 'package:demo/message_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _current = 0;
  final _pages = [
    const HomePage(),
    const MessagePage(),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.deepOrange,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_current],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _current = value;
          });
        },
        currentIndex: _current,
        items: [
          _getBottomNavigationBarItem(
              "assets/images/ic_home.png", "assets/images/ic_home_select.png"),
          _getBottomNavigationBarItem(
              "assets/images/ic_chat.png", "assets/images/ic_chat_select.png"),
          _getBottomNavigationBarItem(
              "assets/images/ic_setting.png", "assets/images/ic_setting.png"),
          _getBottomNavigationBarItem(
              "assets/images/ic_profile.png", "assets/images/ic_profile.png")
        ],
      ),
    );
  }

  BottomNavigationBarItem _getBottomNavigationBarItem(
      String iconPth, String activeIconPath) {
    return BottomNavigationBarItem(
      icon: Image.asset(iconPth),
      activeIcon: Image.asset(activeIconPath),
      label: "",
    );
  }
}
