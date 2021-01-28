import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class GiftCards extends StatelessWidget {
  final String giftImage;
  final String giftAmount;
  final String donationAction;
  GiftCards({
    this.giftImage,
    this.giftAmount,
    this.donationAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
      child: Card(
        color: Colors.black,
        elevation: 10.0,
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 0.0),
            child: Column(
              children: <Widget>[
                Image.asset(
                  giftImage,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.lightGreenAccent,
                    child: Text(
                      giftAmount,
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    onPressed: () {
                      UrlLauncher.launch(donationAction);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
