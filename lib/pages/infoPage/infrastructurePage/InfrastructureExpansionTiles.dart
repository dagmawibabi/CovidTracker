import 'package:flutter/material.dart';

class InfrastructureExpansionTiles extends StatelessWidget {
  final dynamic leadingImage;
  final String title;
  final String content;
  InfrastructureExpansionTiles({
    this.leadingImage,
    this.title,
    this.content,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[50],
      child: ExpansionTile(
        backgroundColor: Colors.blueGrey[50],
        leading: CircleAvatar(
          radius: 16.0,
          backgroundImage: AssetImage(leadingImage),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xfffafae8),
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  content, //"I used Google's Flutter framework to develop this entire mobile app.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
