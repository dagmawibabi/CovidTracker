import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class SocialMediaLinksCard extends StatelessWidget {
  final String socialMediaIcon;
  final String socialMediaUsername;
  final double socialMediaUsernameFontSize;
  final String socialMediaLink;

  SocialMediaLinksCard({
    this.socialMediaIcon,
    this.socialMediaUsername,
    this.socialMediaUsernameFontSize,
    this.socialMediaLink,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            socialMediaIcon,
          ),
          radius: 16.0,
          backgroundColor: Colors.white,
        ),
        title: Text(
          socialMediaUsername,
          style: TextStyle(
            fontSize: socialMediaUsernameFontSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: IconButton(
          icon: Icon(FlutterIcons.arrowright_ant),
          onPressed: () {
            UrlLauncher.launch(socialMediaLink);
          },
        ),
      ),
    );
  }
}
