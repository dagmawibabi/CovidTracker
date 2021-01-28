import 'package:CovidTracker/pages/statsRow.dart';
import 'package:flutter/material.dart';
import 'package:CovidTracker/pages/valueCards.dart';

void main() {
  runApp(WorldPage());
}

class WorldPage extends StatefulWidget {
  final Map worldData;
  final bool isDarkTheme;
  WorldPage({
    this.worldData,
    this.isDarkTheme,
  });
  @override
  _WorldPageState createState() => _WorldPageState();
}

class _WorldPageState extends State<WorldPage> {
  String updateTime;
  int todayCasesValue;
  int todayDeathsValue;
  int todayRecoveredValue;
  int testsValue;
  int criticalValue;
  int populationValue;
  int oneCasePerPeopleValue;
  int oneDeathPerPeopleValue;
  int oneTestPerPeopleValue;
  int casesPerOneMillionValue;
  int testsPerOneMillionValue;
  int deathsPerOneMillionValue;
  int activePerOneMillionValue;
  int recoveredPerOneMillionValue;
  int criticalPerOneMillionValue;
  int activeValue;
  int recoveredValue;
  int deathsValue;
  int casesValue;
  int affectedCountriesValue;

  void assignValues() {
    // WORLD STATS
    // Update Time
    int unixTime = widget.worldData["updated"];
    var date = new DateTime.fromMicrosecondsSinceEpoch(unixTime * 1000);
    updateTime = "Last Updated: " + date.toString();
    // Today Stats
    todayCasesValue = widget.worldData["todayCases"].toInt();
    todayDeathsValue = widget.worldData["todayDeaths"].toInt();
    todayRecoveredValue = widget.worldData["todayRecovered"].toInt();
    // MORE STATS
    // BASIC
    testsValue = widget.worldData["tests"].toInt();
    criticalValue = widget.worldData["critical"].toInt();
    populationValue = widget.worldData["population"].toInt();
    // PER PEOPLE
    oneCasePerPeopleValue = widget.worldData["oneCasePerPeople"].toInt();
    oneDeathPerPeopleValue = widget.worldData["oneDeathPerPeople"].toInt();
    oneTestPerPeopleValue = widget.worldData["oneTestPerPeople"].toInt();
    // PER MILLION
    casesPerOneMillionValue = widget.worldData["casesPerOneMillion"].toInt();
    testsPerOneMillionValue = widget.worldData["testsPerOneMillion"].toInt();
    deathsPerOneMillionValue = widget.worldData["deathsPerOneMillion"].toInt();
    activePerOneMillionValue = widget.worldData["activePerOneMillion"].toInt();
    recoveredPerOneMillionValue =
        widget.worldData["recoveredPerOneMillion"].toInt();
    criticalPerOneMillionValue =
        widget.worldData["criticalPerOneMillion"].toInt();
    // Total Stats
    activeValue = widget.worldData["active"].toInt();
    recoveredValue = widget.worldData["recovered"].toInt();
    deathsValue = widget.worldData["deaths"].toInt();
    casesValue = widget.worldData["cases"].toInt();
    affectedCountriesValue = widget.worldData["affectedCountries"].toInt();
  }

  Color lightDarkThemeCardColor;
  Color lightDarkThemeTextColor;
  String lightDarkThemeEarthIcon;
  String worldIcon;
  void checkForTheme() {
    if (widget.isDarkTheme) {
      lightDarkThemeTextColor = Colors.white;
      lightDarkThemeCardColor = Colors.black;
      worldIcon = "images/worldPage_Imgs/darkThemeEarthIcon.jpg";
    } else {
      lightDarkThemeTextColor = Colors.black;
      lightDarkThemeCardColor = Colors.white;
      worldIcon = "images/worldPage_Imgs/lightThemeEarthIcon.jpg";
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    assignValues();
  }

  @override
  Widget build(BuildContext context) {
    checkForTheme();
    return ListView(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              // H E A D E R
              Card(
                color: lightDarkThemeCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: <Widget>[
                    Text(
                      "WORLD DATA",
                      style: TextStyle(
                        color: lightDarkThemeTextColor,
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Image.asset("images/worldPage_Imgs/affected_world_map.jpg"),
                  ]),
                ),
              ),
              // TODAY STATS
              Card(
                color: lightDarkThemeCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "TODAY STATS",
                              style: TextStyle(
                                color: lightDarkThemeTextColor,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: Image.asset(worldIcon),
                            ),
                          ],
                        ),
                      ),
                      StatsRow(
                        cardColor1: Colors.lightBlueAccent,
                        title1: "New Cases",
                        value1: todayCasesValue,
                        cardColor2: Colors.lightGreenAccent,
                        title2: "Recovered",
                        value2: todayRecoveredValue,
                        cardColor3: Colors.redAccent,
                        title3: "Deaths",
                        value3: todayDeathsValue,
                      ),
                    ],
                  ),
                ),
              ),
              // MORE STATS
              Card(
                color: lightDarkThemeCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "MORE STATS",
                              style: TextStyle(
                                color: lightDarkThemeTextColor,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: Image.asset(worldIcon),
                            ),
                          ],
                        ),
                      ),
                      // Basic
                      Card(
                        color: Colors.grey[850],
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 2.0, 8.0, 2.0),
                                  child: Text(
                                    "BASIC",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            StatsRow(
                              cardColor1: Color(0xff66aaff),
                              title1: "Population",
                              value1: populationValue,
                              cardColor2: Color(0xff66aaff),
                              title2: "Tests",
                              value2: testsValue,
                              cardColor3: Color(0xff66aaff),
                              title3: "Critical",
                              value3: criticalValue,
                            ),
                          ],
                        ),
                      ),
                      // Per People
                      Card(
                        color: Colors.grey[850],
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 2.0, 8.0, 2.0),
                                  child: Text(
                                    "PER PEOPLE",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            StatsRow(
                              cardColor1: Colors.teal[300],
                              title1: "One Case Per People",
                              value1: oneCasePerPeopleValue,
                              cardColor2: Colors.teal[300],
                              title2: "One Test Per People",
                              value2: oneTestPerPeopleValue,
                              cardColor3: Colors.teal[300],
                              title3: "One Death Per People",
                              value3: oneDeathPerPeopleValue,
                            ),
                          ],
                        ),
                      ),
                      // Per Million
                      Card(
                        color: Colors.grey[850],
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      8.0, 2.0, 8.0, 2.0),
                                  child: Text(
                                    "PER MILLION",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            StatsRow(
                              cardColor1: Color(0xffd4d400),
                              title1: "Cases Per One Million Value",
                              value1: casesPerOneMillionValue,
                              cardColor2: Color(0xffd4d400),
                              title2: "Tests Per One Million",
                              value2: testsPerOneMillionValue,
                              cardColor3: Color(0xffd4d400),
                              title3: "Deaths Per One Million",
                              value3: deathsPerOneMillionValue,
                            ),
                            StatsRow(
                              cardColor1: Colors.deepOrange[300],
                              title1: "Active Per One Million Value",
                              value1: activePerOneMillionValue,
                              cardColor2: Colors.deepOrange[300],
                              title2: "Recovered Per One Million",
                              value2: recoveredPerOneMillionValue,
                              cardColor3: Colors.deepOrange[300],
                              title3: "Critical Per One Million",
                              value3: criticalPerOneMillionValue,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // TOTAL STATS
              Card(
                color: lightDarkThemeCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "TOTAL STATS",
                              style: TextStyle(
                                color: lightDarkThemeTextColor,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              width: 30.0,
                              height: 30.0,
                              child: Image.asset(worldIcon),
                            ),
                          ],
                        ),
                      ),
                      StatsRow(
                        cardColor1: Colors.lightBlueAccent,
                        title1: "Active",
                        value1: activeValue,
                        cardColor2: Colors.lightGreenAccent,
                        title2: "Recovered",
                        value2: recoveredValue,
                        cardColor3: Colors.redAccent,
                        title3: "Deaths",
                        value3: deathsValue,
                      ),
                      Row(
                        children: <Widget>[
                          ValueCards(
                            cardColor: Colors.amber,
                            title: "Total Cases",
                            value: casesValue,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              // Update Time
              Text(
                updateTime,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
