import 'package:flutter/material.dart';
import 'package:CovidTracker/pages/infoPage/infoPage.dart';
import 'package:CovidTracker/pages/homePage/homePage.dart';
import 'package:CovidTracker/pages/loadingPage/loadingPage.dart';
import 'package:CovidTracker/pages/infoPage/infrastructurePage/easterEggPage.dart';

void main() {
  runApp(CovidStats());
}

class CovidStats extends StatefulWidget {
  @override
  _CovidStatsState createState() => _CovidStatsState();
}

class _CovidStatsState extends State<CovidStats> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Covid Tracker",
      initialRoute: "/",
      routes: {
        "/": (context) => LoadingPage(),
        "homePage": (context) => HomePage(),
        "infoPage": (context) => InfoPage(),
        "easterEggPage": (context) => EasterEggPage(),
      },
    );
  }
}
