import 'package:flutter/material.dart';
import 'package:CovidTracker/pages/infoPage/developerPage/socialMediaLinksCard.dart';

void main() {
  runApp(DeveloperPage());
}

class DeveloperPage extends StatefulWidget {
  @override
  _DeveloperPageState createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage> {
  List socialMediaContacts = [
    {
      "icon": "images/developerPage_Imgs/TwitterIcon.png",
      "username": "@DagmawiBabi",
      "socialMediaUsernameFontSize": 17.0,
      "link": "http://t.co/dagmawibabi",
    },
    {
      "icon": "images/developerPage_Imgs/InstagramIcon.jpg",
      "username": "@DagmawiBabi",
      "socialMediaUsernameFontSize": 17.0,
      "link": "http://www.instagram.com/dagmawibabi",
    },
    {
      "icon": "images/developerPage_Imgs/TelegramIcon.png",
      "username": "@Dagmawi_Babi",
      "socialMediaUsernameFontSize": 16.0,
      "link": "https://t.me/Dagmawi_Babi",
    },
    {
      "icon": "images/developerPage_Imgs/GitHubIcon.png",
      "username": "@Dagmawi_Babi",
      "socialMediaUsernameFontSize": 16.0,
      "link": "http://www.github.com/dagmawibabi",
    },
    {
      "icon": "images/developerPage_Imgs/GmailIcon.png",
      "username": "1babidagi@gmail.com",
      "socialMediaUsernameFontSize": 15.0,
      "link":
          "mailto:1babidagi@gmail.com?subject=User of your COVID Tracking app&body=Hello Dagmawi,",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DEVELOPER"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Column(
                  children: <Widget>[
                    // Rounded Profile Picture
                    Card(
                      elevation: 0.0,
                      child: CircleAvatar(
                        radius: 80.0,
                        backgroundImage:
                            AssetImage("images/developerPage_Imgs/myPic.jpeg"),
                      ),
                    ),
                    // Simple intro paragraph
                    Card(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Hello I am Dagmawi Esayas. \nI'm the developer of this app. If you want to give me feedbacks or want to reach out to me for anything related, you can use any of the following links. \nI'd be more than glad to talk to you! :)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                    // All social media links
                    Card(
                      color: Colors.blueAccent,
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            SocialMediaLinksCard(
                              socialMediaIcon: socialMediaContacts[0]["icon"],
                              socialMediaUsername: socialMediaContacts[0]
                                  ["username"],
                              socialMediaUsernameFontSize:
                                  socialMediaContacts[0]
                                      ["socialMediaUsernameFontSize"],
                              socialMediaLink: socialMediaContacts[0]["link"],
                            ),
                            SocialMediaLinksCard(
                              socialMediaIcon: socialMediaContacts[1]["icon"],
                              socialMediaUsername: socialMediaContacts[1]
                                  ["username"],
                              socialMediaUsernameFontSize:
                                  socialMediaContacts[1]
                                      ["socialMediaUsernameFontSize"],
                              socialMediaLink: socialMediaContacts[1]["link"],
                            ),
                            SocialMediaLinksCard(
                              socialMediaIcon: socialMediaContacts[2]["icon"],
                              socialMediaUsername: socialMediaContacts[2]
                                  ["username"],
                              socialMediaUsernameFontSize:
                                  socialMediaContacts[2]
                                      ["socialMediaUsernameFontSize"],
                              socialMediaLink: socialMediaContacts[2]["link"],
                            ),
                            SocialMediaLinksCard(
                              socialMediaIcon: socialMediaContacts[3]["icon"],
                              socialMediaUsername: socialMediaContacts[3]
                                  ["username"],
                              socialMediaUsernameFontSize:
                                  socialMediaContacts[3]
                                      ["socialMediaUsernameFontSize"],
                              socialMediaLink: socialMediaContacts[3]["link"],
                            ),
                            SocialMediaLinksCard(
                              socialMediaIcon: socialMediaContacts[4]["icon"],
                              socialMediaUsername: socialMediaContacts[4]
                                  ["username"],
                              socialMediaUsernameFontSize:
                                  socialMediaContacts[4]
                                      ["socialMediaUsernameFontSize"],
                              socialMediaLink: socialMediaContacts[4]["link"],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      "images/developerPage_Imgs/socialMediaContacts.png",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
