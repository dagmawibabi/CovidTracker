import 'package:CovidTracker/pages/countryPage/countryPage.dart';
import 'package:CovidTracker/pages/healthAdvices/healthAdvices.dart';
import 'package:CovidTracker/pages/vaccinesPage/vaccinesPage.dart';
import 'package:CovidTracker/pages/worldPage/worldPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(MaterialApp(
    title: "Covid Stats",
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map receivedData;
  int _currentIndex = 1;
  bool isDarkTheme = false;
  Color scaffoldBackgroundColor;
  Color appBarBackgroundColor;
  Color bottomNavBarBackgroundColor;
  IconData curLightDarkThemeSwitchIcon;
  Color unselectedBottomNavItemColor;
  Color selectedBottomNavItemColor;
  void changeTheme() {
    if (isDarkTheme) {
      // LIGHT THEME
      isDarkTheme = false;
      appBarBackgroundColor = Colors.amber[700];
      scaffoldBackgroundColor = Colors.grey[700];
      bottomNavBarBackgroundColor = Colors.amber[700];
      curLightDarkThemeSwitchIcon = FlutterIcons.moon_o_faw;
      unselectedBottomNavItemColor = Colors.black;
      selectedBottomNavItemColor = Colors.black;
    } else {
      // DARK THEME
      isDarkTheme = true;
      appBarBackgroundColor = Colors.black;
      scaffoldBackgroundColor = Colors.grey[700];
      bottomNavBarBackgroundColor = Colors.black;
      curLightDarkThemeSwitchIcon = FlutterIcons.sun_fea;
      unselectedBottomNavItemColor = Colors.grey;
      selectedBottomNavItemColor = Colors.white;
    }
  }

  @override
  void initState() {
    super.initState();
    changeTheme();
  }

  @override
  Widget build(BuildContext context) {
    receivedData = ModalRoute.of(context).settings.arguments;
    // Different Pages for the bottom nav bar
    List tabs = [
      WorldPage(
        worldData: receivedData["worldData"],
        isDarkTheme: isDarkTheme,
      ),
      CountryPage(
        countryNames: receivedData["countryNames"],
        countriesData: receivedData["countriesData"],
        searchedCountry: receivedData["searchedCountry"],
        isDarkTheme: isDarkTheme,
      ),
      VaccinesPage(
        vaccinesData: receivedData["vaccinesData"],
        isDarkTheme: isDarkTheme,
      ),
      HealthPage(
        isDarkTheme: isDarkTheme,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        // A P P  B A R
        appBar: AppBar(
          backgroundColor: appBarBackgroundColor,
          title: Text(
            "COVID STATS",
            style: TextStyle(
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
          ),
          centerTitle: true,
          // Light Dart Switch Button
          actions: <Widget>[
            IconButton(
              icon: Icon(
                curLightDarkThemeSwitchIcon,
              ),
              color: isDarkTheme ? Colors.white : Colors.black,
              onPressed: () {
                changeTheme();
                WorldPage(
                  worldData: receivedData["worldData"],
                  isDarkTheme: isDarkTheme,
                );
                CountryPage(
                  countryNames: receivedData["countryNames"],
                  countriesData: receivedData["countriesData"],
                  searchedCountry: receivedData["searchedCountry"],
                  isDarkTheme: isDarkTheme,
                );
                VaccinesPage(
                  vaccinesData: receivedData["vaccinesData"],
                  isDarkTheme: isDarkTheme,
                );
                setState(() {});
              },
            ),
          ],
          leading: IconButton(
            icon: Icon(
              FlutterIcons.gift_ant,
              color: isDarkTheme ? Colors.white : Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "infoPage");
            },
          ),
        ),
        // B O D Y - D I F F E R E N T  T A B S
        body: tabs[_currentIndex],
        // B O T T O M  N A V B A R
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          backgroundColor: bottomNavBarBackgroundColor,
          selectedItemColor: selectedBottomNavItemColor,
          selectedIconTheme: IconThemeData(size: 32.0),
          selectedFontSize: 14.0,
          unselectedItemColor: unselectedBottomNavItemColor,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.earth_mco),
              title: Text("World"),
              activeIcon: Icon(
                FlutterIcons.earth_mco,
                color: isDarkTheme ? Colors.lightBlue : Colors.blue[900],
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.location_searching_mdi),
              title: Text("Country"),
              activeIcon: Icon(
                FlutterIcons.location_searching_mdi,
                color: isDarkTheme ? Colors.yellowAccent : Colors.yellow,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.syringe_faw5s),
              title: Text("Vaccines"),
              activeIcon: Icon(
                FlutterIcons.syringe_faw5s,
                color: isDarkTheme ? Colors.purpleAccent : Colors.deepPurple,
                size: 28.0,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              title: Text("Health"),
              activeIcon: Icon(
                Icons.local_hospital,
                color:
                    isDarkTheme ? Colors.lightGreenAccent : Colors.green[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
