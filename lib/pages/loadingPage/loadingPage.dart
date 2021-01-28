import 'package:flutter/material.dart';
import "package:flutter_spinkit/flutter_spinkit.dart";
import 'package:CovidTracker/pages/fetchData.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  FetchData instance;
  bool isFetching = true;
  bool errorEncountered = false;
  String errorMessage;
  TextEditingController _countrySearch = TextEditingController();
  void getAllData() async {
    isFetching = true;
    errorEncountered = false;
    setState(() {});
    try {
      instance = FetchData();
      await instance.getData();
      getCountryNames();
    } catch (e) {
      errorEncountered = true;
      errorMessage =
          "Error Encountered! \nPlease Check Your Internet Connection and Try Again...";
    }
    isFetching = false;
    setState(() {});
  }

  List countryNames = [];
  void getCountryNames() {
    for (var i = 0; i < instance.countriesData.length; i++) {
      countryNames.add(
          instance.countriesData[i]["country"].toString().trim().toLowerCase());
    }
  }

  Future<void> checkForSearchErrors(searchedCountry) async {
    if (!(countryNames
        .contains(searchedCountry.toString().trim().toLowerCase()))) {
      errorEncountered = true;
      errorMessage =
          "Country not found or doesn't have any cases! Please Check your spelling and Try Again...";
      setState(() {});
    } else {
      errorEncountered = false;
      setState(() {});
      Navigator.pushReplacementNamed(
        context,
        "homePage",
        arguments: {
          "worldData": instance.worldData,
          "countryNames": countryNames,
          "countriesData": instance.countriesData,
          "searchedCountry": _countrySearch.text,
          "vaccinesData": instance.vaccinesData,
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              repeat: ImageRepeat.noRepeat,
              matchTextDirection: false,
              alignment: Alignment.center,
              image: AssetImage("images/LoadingPageImage.jpg"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(),
              Column(
                children: <Widget>[
                  Text(
                    "COVID STATS",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  if (isFetching)
                    SpinKitFadingCircle(
                      color: Colors.white,
                    )
                  else if (errorEncountered == false)
                    Container(
                      child: Card(
                        color: Colors.grey[850],
                        child: TextField(
                          controller: _countrySearch,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            prefixIcon: Icon(
                              Icons.place,
                              color: Colors.grey[400],
                            ),
                            labelText: "Enter Country",
                            labelStyle: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 18.0,
                            ),
                            hintText: "Country",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                checkForSearchErrors(_countrySearch.text);
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              errorMessage,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              iconSize: 20.0,
                              icon: Icon(
                                Icons.autorenew,
                                color: Colors.lightGreen,
                              ),
                              onPressed: () {
                                getAllData();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Made by Dream Intelligence.",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Abel",
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    "Aug, 2020 GC",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Abel",
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
