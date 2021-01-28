import 'package:CovidTracker/pages/infoPage/supportPage/giftCards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

void main() {
  runApp(SupportPage());
}

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  TextEditingController giftAmountController = TextEditingController();
  List giftCards = [
    {
      "giftImage": "images/supportPage_Imgs/donationGifts3.png",
      "giftAmount": "2 ETB",
      "donationAction": "tel:*806*0975124687*2",
    },
    {
      "giftImage": "images/supportPage_Imgs/donationGifts2.png",
      "giftAmount": "5 ETB",
      "donationAction": "tel:*806*0975124687*5",
    },
    {
      "giftImage": "images/supportPage_Imgs/donationGifts4.png",
      "giftAmount": "10 ETB",
      "donationAction": "tel:*806*0975124687*10",
    },
    {
      "giftImage": "images/supportPage_Imgs/donationGifts5.png",
      "giftAmount": "25 ETB",
      "donationAction": "tel:*806*0975124687*25",
    },
    {
      "giftImage": "images/supportPage_Imgs/donationGifts1.png",
      "giftAmount": "50 ETB",
      "donationAction": "tel:*806*0975124687*50",
    },
    {
      "giftImage": "images/supportPage_Imgs/donationGifts6.png",
      "giftAmount": "100 ETB",
      "donationAction": "tel:*806*0975124687*100",
    },
    {
      "giftImage": "images/supportPage_Imgs/donationMakeItRain.png",
      "giftAmount": "make it rain",
      "donationAction": "tel:*806*0975124687*",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text("GIFTS"),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        children: <Widget>[
          // Asking for support
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
            child: Card(
              elevation: 10.0,
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 100.0,
                      backgroundImage: AssetImage(
                        "images/supportPage_Imgs/maleIcon.png",
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Hello There! \nI'm hoping this app has come handy to you. \nEverything provided in this app is totally free. And if you like to see more apps like this from me or improve this one, you can support me by sending me any amount of donation you like through the following.\nThank You for your support! \n- Dagmawi Esayas -",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Pacifico",
                        fontSize: 21.0,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Informative
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
            child: Card(
              elevation: 10.0,
              color: Colors.lightGreenAccent[100],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20.0),
                child: Text(
                  "To support me... \nChoose any of the following gift cards and press their respective botton. Then when it takes you to your phone's dialer press '#' to confirm and call. \nThank You Kindly!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: "Abel",
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          //Gift Cards
          GiftCards(
            giftImage: giftCards[0]["giftImage"],
            giftAmount: giftCards[0]["giftAmount"],
            donationAction: giftCards[0]["donationAction"],
          ),
          GiftCards(
            giftImage: giftCards[1]["giftImage"],
            giftAmount: giftCards[1]["giftAmount"],
            donationAction: giftCards[1]["donationAction"],
          ),
          GiftCards(
            giftImage: giftCards[2]["giftImage"],
            giftAmount: giftCards[2]["giftAmount"],
            donationAction: giftCards[2]["donationAction"],
          ),
          GiftCards(
            giftImage: giftCards[3]["giftImage"],
            giftAmount: giftCards[3]["giftAmount"],
            donationAction: giftCards[3]["donationAction"],
          ),
          GiftCards(
            giftImage: giftCards[4]["giftImage"],
            giftAmount: giftCards[4]["giftAmount"],
            donationAction: giftCards[4]["donationAction"],
          ),
          GiftCards(
            giftImage: giftCards[5]["giftImage"],
            giftAmount: giftCards[5]["giftAmount"],
            donationAction: giftCards[5]["donationAction"],
          ),
          // Make It Rain
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
            child: Card(
              color: Colors.deepPurple,
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    // Make it rain informatice
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "MAKE IT RAIN",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Container(
                              child: Text(
                                "If you want to gift whatever amount you want just type in the amount below and make it rainnnn...",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Container(
                              child: Text(
                                "(Click '#' to confirm when you're taken to your dialpad and call)",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Image.asset(
                      giftCards[6]["giftImage"],
                    ),
                    // Inputbox
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: TextField(
                          controller: giftAmountController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            prefixIcon: Icon(
                              Icons.attach_money,
                              color: Colors.black,
                            ),
                            labelText: "Enter Amount In Birr",
                            labelStyle: TextStyle(
                              fontSize: 18.0,
                            ),
                            hintText: "ETB",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                            suffixIcon: Icon(
                              FlutterIcons.gift_ant,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Make it rain button
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 4.0),
                        child: RaisedButton(
                          color: Colors.lightGreenAccent,
                          child: Text(
                            giftCards[6]["giftAmount"],
                            style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: "Pacifico",
                            ),
                          ),
                          onPressed: () {
                            UrlLauncher.launch(giftCards[6]["donationAction"] +
                                giftAmountController.text);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Thank You Card
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
            child: Card(
              elevation: 10.0,
              color: Colors.yellow,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30.0, horizontal: 2.0),
                child: Text(
                  "Thank You Very Much!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Pacifico",
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
