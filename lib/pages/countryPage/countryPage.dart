import 'package:CovidTracker/pages/statsRow.dart';
import 'package:flutter/material.dart';
import 'package:CovidTracker/pages/valueCards.dart';

void main() {
  runApp(CountryPage());
}

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
  final List countryNames;
  final List countriesData;
  final String searchedCountry;
  final bool isDarkTheme;
  CountryPage({
    this.countryNames,
    this.countriesData,
    this.searchedCountry,
    this.isDarkTheme,
  });
}

class _CountryPageState extends State<CountryPage> {
  TextEditingController _countrySearch = TextEditingController();
  bool errorEncountered = false;
  Map currentCountryData;
  // Data Update Time
  String updateTime;
  //Data Values
  String continent;
  String country;
  String flag;
  //Today
  int todayCasesValue;
  int todayRecoveredValue;
  int todayDeathsValue;
  //More
  int criticalValue;
  int testsValue;
  int populationValue;
  int casesPerOneMillionValue;
  int testsPerOneMillionValue;
  int deathsPerOneMillionValue;
  int oneCasePerPeopleValue;
  int oneTestPerPeopleValue;
  int oneDeathPerPeopleValue;
  //Total
  int activeValue;
  int recoveredValue;
  int deathsValue;
  int casesValue;
  void getSearchedCountryData(searchedCountry) async {
    int index = 0;
    bool state = true;
    while (state) {
      if (widget.countriesData[index]["country"].toString().toLowerCase() ==
          searchedCountry) {
        state = false;
        currentCountryData = widget.countriesData[index];
      }
      index++;
    }
    // Assign Values
    // Last Updated Time
    int unixTime = currentCountryData["updated"];
    var date = new DateTime.fromMicrosecondsSinceEpoch(unixTime * 1000);
    updateTime = "Last Updated: " + date.toString();
    // Main Vars
    country = currentCountryData["country"];
    continent = currentCountryData["continent"];
    flag = currentCountryData["countryInfo"]["flag"];
    // Today Stats
    todayCasesValue = currentCountryData["todayCases"];
    todayRecoveredValue = currentCountryData["todayRecovered"];
    todayDeathsValue = currentCountryData["todayDeaths"];
    // More Stats
    criticalValue = currentCountryData["critical"];
    testsValue = currentCountryData["tests"];
    populationValue = currentCountryData["population"];
    casesPerOneMillionValue = currentCountryData["casesPerOneMillion"];
    testsPerOneMillionValue = currentCountryData["testsPerOneMillion"];
    deathsPerOneMillionValue = currentCountryData["deathsPerOneMillion"];
    oneCasePerPeopleValue = currentCountryData["oneCasePerPeople"];
    oneTestPerPeopleValue = currentCountryData["oneTestPerPeople"];
    oneDeathPerPeopleValue = currentCountryData["oneDeathPerPeople"];
    // Total Stats
    activeValue = currentCountryData["active"];
    recoveredValue = currentCountryData["recovered"];
    deathsValue = currentCountryData["deaths"];
    casesValue = currentCountryData["cases"];
    setState(() {});
  }

  Future<void> checkForSearchErrors(searchedCountry) async {
    if (!(widget.countryNames
        .contains(searchedCountry.toString().trim().toLowerCase()))) {
      errorEncountered = true;
      setState(() {});
    } else {
      errorEncountered = false;
      setState(() {});
      getSearchedCountryData(searchedCountry.toString().trim().toLowerCase());
    }
  }

  Color lightDarkThemeCardColor;
  Color lightDarkThemeTextColor;
  void checkForTheme() {
    if (widget.isDarkTheme) {
      lightDarkThemeTextColor = Colors.white;
      lightDarkThemeCardColor = Colors.black;
    } else {
      lightDarkThemeTextColor = Colors.black;
      lightDarkThemeCardColor = Colors.white;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    checkForSearchErrors(widget.searchedCountry);
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
                child: Column(
                  children: <Widget>[
                    Card(
                      elevation: 10.0,
                      color: lightDarkThemeCardColor,
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(14.0, 6.0, 10.0, 6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: SizedBox(
                                height: 24.0,
                                width: 90.0,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    continent,
                                    style: TextStyle(
                                      color: lightDarkThemeTextColor,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: 20.0,
                                height: 35.0,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Image.network(flag),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 24.0,
                                width: 90.0,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    country,
                                    style: TextStyle(
                                      color: lightDarkThemeTextColor,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // S E A R C H  B O X
                    Card(
                      elevation: 10.0,
                      color: lightDarkThemeCardColor,
                      child: TextField(
                        controller: _countrySearch,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: lightDarkThemeTextColor,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          prefixIcon: Icon(
                            Icons.place,
                            color: lightDarkThemeTextColor,
                          ),
                          labelText: "Enter Country",
                          labelStyle: TextStyle(
                            color: lightDarkThemeTextColor,
                            fontSize: 18.0,
                          ),
                          hintText: "Country",
                          hintStyle: TextStyle(
                            color: lightDarkThemeTextColor,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: lightDarkThemeTextColor,
                            ),
                            onPressed: () {
                              checkForSearchErrors(_countrySearch.text);
                            },
                          ),
                        ),
                      ),
                    ),
                    // Error Text
                    if (errorEncountered)
                      Container(
                        color: lightDarkThemeCardColor,
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Expanded(
                                child: Text(
                                  "Country not found or doesn't have any cases! Please check your spelling and Try Again.",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: lightDarkThemeTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      Container(),
                  ],
                ),
              ),
              // T O D A Y  C A S E S
              Card(
                elevation: 10.0,
                color: lightDarkThemeCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
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
                              child: Image.network(flag),
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
              // M O R E  S T A T S
              Card(
                elevation: 10.0,
                color: lightDarkThemeCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
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
                              child: Image.network(flag),
                            ),
                          ],
                        ),
                      ),
                      // Basic
                      Card(
                        color: Colors.grey[850],
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
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
                                cardColor1: Color(0xffada3e0),
                                title1: "Population",
                                value1: populationValue,
                                cardColor2: Color(0xffada3e0),
                                title2: "Tests",
                                value2: testsValue,
                                cardColor3: Color(0xffada3e0),
                                title3: "Critical",
                                value3: criticalValue,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Per People
                      Card(
                        color: Colors.grey[850],
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
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
                                cardColor1: Color(0xffa3e0ad),
                                title1: "One Case Per People",
                                value1: oneCasePerPeopleValue,
                                cardColor2: Color(0xffa3e0ad),
                                title2: "One Test Per People",
                                value2: oneTestPerPeopleValue,
                                cardColor3: Color(0xffa3e0ad),
                                title3: "One Death Per People",
                                value3: oneDeathPerPeopleValue,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Per Million
                      Card(
                        color: Colors.grey[850],
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
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
                                cardColor1: Color(0xfff9f9d7),
                                title1: "Cases Per One Million",
                                value1: casesPerOneMillionValue,
                                cardColor2: Color(0xfff9f9d7),
                                title2: "Tests Per One Million",
                                value2: testsPerOneMillionValue,
                                cardColor3: Color(0xfff9f9d7),
                                title3: "Deaths Per One Million",
                                value3: deathsPerOneMillionValue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // T O T A L  S T A T S
              Card(
                elevation: 10.0,
                color: lightDarkThemeCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
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
                              child: Image.network(flag),
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
                            value: casesValue,
                            title: "Total Cases",
                            cardColor: Colors.amber,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Update Time
              SizedBox(
                height: 40.0,
              ),
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
