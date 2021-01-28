import 'package:flutter/material.dart';

void main() {
  runApp(EasterEggPage());
}

class EasterEggPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Card(
                elevation: 10.0,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "CONGRATULATIONS!",
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "You have found the hidden prize",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        "To get your prize please screenshot this page and send it to me by any of my social links.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Image.asset(
                        "images/winnerQRCode.jpg",
                        height: 200.0,
                        width: 200.0,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Thank you for using my app! \n - Dagmawi Esayas -",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
