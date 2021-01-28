import 'package:flutter/material.dart';

class CurstomExpansionTile extends StatelessWidget {
  final Color cardColor;
  final IconData leadingIcon;
  final String title;
  final Color contentBackgroundColor;
  final dynamic content;

  CurstomExpansionTile({
    this.leadingIcon,
    this.title,
    this.cardColor,
    this.contentBackgroundColor,
    this.content,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionTile(
              backgroundColor: Colors.transparent,
              leading: Icon(
                leadingIcon,
                color: Colors.black,
              ),
              title: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: contentBackgroundColor,
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            content
                                .toString()
                                .replaceAll(new RegExp(r"\["), "")
                                .replaceAll(new RegExp(r"\]"), "")
                                .replaceAll(new RegExp(r", "), "\n"),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
