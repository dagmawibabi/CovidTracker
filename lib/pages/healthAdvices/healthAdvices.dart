import 'package:CovidTracker/pages/healthAdvices/informativeCards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

void main() {
  runApp(HealthPage());
}

class HealthPage extends StatefulWidget {
  final bool isDarkTheme;
  HealthPage({this.isDarkTheme});
  @override
  _HealthPageState createState() => _HealthPageState();
}

class _HealthPageState extends State<HealthPage> {
  bool isDarkTheme = false;
  Color scaffoldBackgroundColor;
  Color appBarBackgroundColor;
  Color bottomNavBarBackgroundColor;
  IconData curLightDarkThemeSwitchIcon;
  List healthAdvices = [
    {
      "mainCardColor": Colors.black,
      "illustrativeImage": "images/healthPage_Imgs/doctors.png",
      "infoCardColor": Colors.black,
      "leadingIcon": FlutterIcons.ear_hearing_mco,
      "content":
          "Keep updated on the latest information from trusted sources and listen to what your national and local health officials say.",
      "contentColor": Colors.white,
      "trailingIcon": FlutterIcons.ear_hearing_mco,
    },
    {
      "mainCardColor": Colors.black,
      "illustrativeImage": "images/healthPage_Imgs/washHands.png",
      "infoCardColor": Colors.black,
      "leadingIcon": FlutterIcons.hand_left_mco,
      "content":
          "Regularly and thoroughly wash your hands with soap and use alcohol-based sanitary products.",
      "contentColor": Colors.white,
      "trailingIcon": FlutterIcons.hand_right_mco,
    },
    {
      "mainCardColor": Colors.black,
      "illustrativeImage":
          "images/healthPage_Imgs/socialDistance_wearMasks.png",
      "infoCardColor": Colors.black,
      "leadingIcon": FlutterIcons.mask_ent,
      "content":
          "Avoid going to crowded places but keep social distance and wear masks if you're going out.",
      "contentColor": Colors.white,
      "trailingIcon": FlutterIcons.mask_ent,
    },
    {
      "mainCardColor": Colors.black,
      "illustrativeImage": "images/healthPage_Imgs/medicalCare.png",
      "infoCardColor": Colors.black,
      "leadingIcon": FlutterIcons.doctor_mco,
      "content":
          "If you have a fever, cough and difficulty breathing seek medical attention.",
      "contentColor": Colors.white,
      "trailingIcon": FlutterIcons.doctor_mco,
    },
  ];

  Color lightDarkThemeCardColor;
  Color lightDarkThemeTextColor;
  Color lightDarkThemeHeaderTextColor;
  Color lightDarkThemeInfoCardColor;
  Color lightDarkThemeIconColor;
  void checkForTheme() {
    if (widget.isDarkTheme) {
      lightDarkThemeTextColor = Colors.white;
      lightDarkThemeCardColor = Colors.black;
      lightDarkThemeInfoCardColor = Colors.black;
      lightDarkThemeIconColor = Colors.lightGreen;
      lightDarkThemeHeaderTextColor = Colors.lightGreen;
    } else {
      lightDarkThemeTextColor = Colors.black;
      lightDarkThemeCardColor = Colors.white;
      lightDarkThemeInfoCardColor = Colors.grey[300];
      lightDarkThemeIconColor = Colors.green[700];
      lightDarkThemeHeaderTextColor = Colors.black;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    checkForTheme();
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: healthAdvices.length,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              // H E A D E R
              if (index == 0)
                Container(
                  width: double.infinity,
                  child: Card(
                    color: lightDarkThemeCardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: <Widget>[
                        Text(
                          "HEALTH ADVICES",
                          style: TextStyle(
                            color: lightDarkThemeHeaderTextColor,
                            fontSize: 20.0,
                          ),
                        ),
                      ]),
                    ),
                  ),
                )
              else
                Container(),
              // I N F O C A R D S
              InformativeCards(
                mainCardColor: lightDarkThemeCardColor,
                illustrativeImage: healthAdvices[index]["illustrativeImage"],
                infoCardColor: lightDarkThemeInfoCardColor,
                leadingIcon: healthAdvices[index]["leadingIcon"],
                content: healthAdvices[index]["content"],
                contentColor: lightDarkThemeTextColor,
                trailingIcon: healthAdvices[index]["trailingIcon"],
                iconColor: lightDarkThemeIconColor,
              ),
              // F O O T E R
              if (index == healthAdvices.length - 1)
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Card(
                      color: Colors.lightGreenAccent,
                      child: ExpansionTile(
                        backgroundColor: Color(0xfffafae8),
                        title: Text(
                          "More Information Source",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        leading: Icon(
                          FlutterIcons.information_outline_mco,
                          color: Colors.black,
                        ),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[50],
                                border:
                                    Border.all(color: Colors.black, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "World Health Organization (W.H.O.)",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(FlutterIcons.open_in_new_mco),
                                      onPressed: () {
                                        UrlLauncher.launch(
                                            "https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public");
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              else
                Container(),
            ],
          ),
        );
      },
    );
  }
}
