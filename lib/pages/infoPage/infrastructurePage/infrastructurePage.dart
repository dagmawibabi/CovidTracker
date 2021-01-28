import 'package:flutter/material.dart';
import 'package:CovidTracker/pages/infoPage/infrastructurePage/InfrastructureExpansionTiles.dart';

void main() {
  runApp(InfrastructurePage());
}

class InfrastructurePage extends StatefulWidget {
  @override
  _InfrastructurePageState createState() => _InfrastructurePageState();
}

class _InfrastructurePageState extends State<InfrastructurePage> {
  List infrastructureDetails = [
    {
      "leadingImage": "images/infrastructurePage_Imgs/APIIcon.png",
      "title": "API",
      "content":
          "I used disease.sh Docs - An open API for disease-related statistics for all the COVID-19 statistics and Vaccine data. \n\nURL: https://corona.lmao.ninja \n[Base URL: disease.sh/]",
    },
    {
      "leadingImage": "images/infrastructurePage_Imgs/DartLangIcon.png",
      "title": "Dart Language",
      "content":
          "I used Google's Dart programming language inside Flutter framework.",
    },
    {
      "leadingImage": "images/infrastructurePage_Imgs/FlutterIcon.png",
      "title": "Flutter Framework",
      "content":
          "I used Google's Flutter framework to develop this entire mobile app.",
    },
  ];
  int prizeKeyCounter = 0;
  void easterEggGift() {
    prizeKeyCounter += 1;
    if (prizeKeyCounter == 50) {
      Navigator.pushNamed(context, "easterEggPage");
      print("been here");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INFRASTRUCTURE"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            color: Colors.greenAccent,
            child: Column(
              children: <Widget>[
                Image.asset("images/infrastructurePage_Imgs/clientServer.png"),
                Card(
                  color: Colors.grey[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Languages and Frameworks Used",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        InfrastructureExpansionTiles(
                          leadingImage: infrastructureDetails[0]
                              ["leadingImage"],
                          title: infrastructureDetails[0]["title"],
                          content: infrastructureDetails[0]["content"],
                        ),
                        InfrastructureExpansionTiles(
                          leadingImage: infrastructureDetails[1]
                              ["leadingImage"],
                          title: infrastructureDetails[1]["title"],
                          content: infrastructureDetails[1]["content"],
                        ),
                        InfrastructureExpansionTiles(
                          leadingImage: infrastructureDetails[2]
                              ["leadingImage"],
                          title: infrastructureDetails[2]["title"],
                          content: infrastructureDetails[2]["content"],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200.0,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Aug, 2020 GC",
                      ),
                      Text(
                        "Dream Intelligence.",
                      ),
                    ],
                  ),
                  onPressed: () {
                    easterEggGift();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
