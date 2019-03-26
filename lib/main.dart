import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'LeaderPage.dart';
import 'SettingPage.dart';
import 'DoubtPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  Widget callPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return DoubtPage();
      case 2:
        return LeaderPage();
      case 3:
        return SettingPage();
        default:
        return HomePage();
    }
  }

  bottombar(String name, Icon i) {
    //user defined function for making a bottom bar
    return BottomNavigationBarItem(icon: i, title: Text(name));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "gridview",
      theme: ThemeData(
        primaryColor: Color(0xff4B00D1),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Gridview"),
        ),
        body: callPage(_currentIndex),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Color(0xff4B00D1),
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Color(0xffFFC0CB),
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.white))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                   _currentIndex = value;
              });
            },
            items: [
              bottombar("Home", Icon(Icons.home)),//calls user defined bottombar function
              bottombar("Doubts", Icon(Icons.device_unknown)),
              bottombar("Leader Board", Icon(Icons.show_chart)),
              bottombar("setting", Icon(Icons.settings))
            ],
          ),
        ),
      ),
    );
  }
}
