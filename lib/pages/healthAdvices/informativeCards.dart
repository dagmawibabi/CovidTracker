import 'package:flutter/material.dart';

class InformativeCards extends StatefulWidget {
  final String illustrativeImage;
  final Color mainCardColor;
  final Color infoCardColor;
  final IconData leadingIcon;
  final String content;
  final Color contentColor;
  final IconData trailingIcon;
  final Color iconColor;
  InformativeCards({
    this.illustrativeImage,
    this.mainCardColor,
    this.infoCardColor,
    this.leadingIcon,
    this.content,
    this.contentColor,
    this.trailingIcon,
    this.iconColor,
  });

  @override
  _InformativeCardsState createState() => _InformativeCardsState();
}

class _InformativeCardsState extends State<InformativeCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Card(
          color: widget.mainCardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 420.0,
                    child: Image.asset(widget.illustrativeImage),
                  ),
                  Card(
                    elevation: 10.0,
                    color: widget.infoCardColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ListTile(
                        leading: Icon(
                          widget.leadingIcon,
                          color: widget.iconColor,
                          size: 30.0,
                        ),
                        title: Text(
                          widget.content,
                          style: TextStyle(
                            color: widget.contentColor,
                            fontSize: 16.0,
                          ),
                        ),
                        trailing: Icon(
                          widget.trailingIcon,
                          color: widget.iconColor,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
