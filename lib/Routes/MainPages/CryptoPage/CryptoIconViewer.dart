import 'package:flutter/material.dart';
import 'package:socialmedia/Routes/UIElements/DesignElements.dart';

void main() {
  runApp(CryptoIconViewer());
}

class CryptoIconViewer extends StatefulWidget {
  @override
  _CryptoIconViewerState createState() => _CryptoIconViewerState();
}

class _CryptoIconViewerState extends State<CryptoIconViewer> {
  @override
  Widget build(BuildContext context) {
    Object? receivedData = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.grey[300], //grey[900],

      body: InkWell(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                (receivedData as Map)["image"],
              ),
              SizedBox(height: 20.0),
              Text(
                receivedData["name"].toString().toUpperCase(),
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.grey[900],
                  fontFamily: DesignElements.tirtiaryFont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
