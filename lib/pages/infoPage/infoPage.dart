import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:CovidTracker/pages/infoPage/supportPage/supportPage.dart';
import 'package:CovidTracker/pages/infoPage/developerPage/developerPage.dart';
import 'package:CovidTracker/pages/infoPage/infrastructurePage/infrastructurePage.dart';

void main() {
  runApp(InfoPage());
}

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  int _currentIndex = 1;
  List tabs = [
    DeveloperPage(),
    SupportPage(),
    InfrastructurePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            _currentIndex = index;
            setState(() {});
          },
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.person_pin_mdi,
              ),
              title: Text("Developer"),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.gift_ant,
              ),
              title: Text("Gift"),
              backgroundColor: Colors.pink,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FlutterIcons.server_faw,
              ),
              title: Text("Infrastructure"),
              backgroundColor: Colors.green,
            ),
          ],
        ));
  }
}
