import 'package:CovidTracker/pages/vaccinesPage/customExpanstionTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(VaccinesPage());
}

class VaccinesPage extends StatefulWidget {
  final Map vaccinesData;
  final bool isDarkTheme;
  VaccinesPage({this.vaccinesData, this.isDarkTheme});
  @override
  _VaccinesPageState createState() => _VaccinesPageState();
}

class _VaccinesPageState extends State<VaccinesPage> {
  String totalVaccinesValue;
  List chosenVaccines = [];
  void setValues() {
    for (var i = 0; i < widget.vaccinesData["data"].length; i++) {
      if (widget.vaccinesData["data"][i]["trialPhase"] == "Phase 3") {
        chosenVaccines.add(widget.vaccinesData["data"][i]);
      } else if (widget.vaccinesData["data"][i]["trialPhase"] == "Phase 2/3") {
        chosenVaccines.add(widget.vaccinesData["data"][i]);
      } else if (widget.vaccinesData["data"][i]["trialPhase"] == "Phase 2") {
        chosenVaccines.add(widget.vaccinesData["data"][i]);
      }
    }
    totalVaccinesValue = widget.vaccinesData["totalCandidates"];
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

    setValues();
  }

  @override
  Widget build(BuildContext context) {
    checkForTheme();
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: chosenVaccines.length,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            // H E A D E R
            if (index == 0)
              Card(
                color: lightDarkThemeCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "VACCINES",
                        style: TextStyle(
                          color: lightDarkThemeTextColor,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        color: Colors.grey[850],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "TOTAL VACCINES",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                totalVaccinesValue,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              Container(),
            Card(
              color: lightDarkThemeCardColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    // Vaccine Number
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Vaccine " + (index + 1).toString(),
                            style: TextStyle(
                              color: lightDarkThemeTextColor,
                              fontSize: 22.0,
                            ),
                          ),
                          Icon(
                            FlutterIcons.syringe_faw5s,
                            color: Colors.purpleAccent,
                            size: 20.0,
                          ),
                        ],
                      ),
                    ),
                    // Phase and Candidate
                    Card(
                      color: Colors.grey[800],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              chosenVaccines[index]["trialPhase"].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            SizedBox(
                              height: 24.0,
                              width: double.infinity,
                              child: FittedBox(
                                child: Text(
                                  chosenVaccines[index]["candidate"].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // INFOS
                    CurstomExpansionTile(
                      leadingIcon: FlutterIcons.doctor_mco,
                      title: "Sponsors",
                      cardColor: Color(0xffe5e500),
                      contentBackgroundColor: Colors.green[50],
                      content: chosenVaccines[index]["sponsors"],
                    ),
                    CurstomExpansionTile(
                      leadingIcon: FlutterIcons.institution_faw,
                      title: "Institutions",
                      cardColor: Colors.orange[500],
                      contentBackgroundColor: Colors.green[50],
                      content:
                          chosenVaccines[index]["institution"].toString() ==
                                  "null"
                              ? "Unknown"
                              : chosenVaccines[index]["institution"],
                    ),
                    CurstomExpansionTile(
                      leadingIcon: FlutterIcons.book_open_outline_mco,
                      title: "Details",
                      cardColor: Color(0xfffafae8),
                      contentBackgroundColor: Colors.blueGrey[50],
                      content: chosenVaccines[index]["details"],
                    ),
                    CurstomExpansionTile(
                      leadingIcon: FlutterIcons.dollar_sign_faw5s,
                      title: "Funding",
                      cardColor: Colors.greenAccent[200],
                      contentBackgroundColor: Colors.green[50],
                      content:
                          chosenVaccines[index]["funding"].toString() == "[]"
                              ? "Unknown"
                              : chosenVaccines[index]["funding"],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        );
      },
    );
  }
}
