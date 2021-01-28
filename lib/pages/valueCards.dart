import 'package:flutter/material.dart';

class ValueCards extends StatelessWidget {
  final int value;
  final String title;
  final Color cardColor;
  final RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  final Function mathFunc = (Match match) => '${match[1]},';
  ValueCards({
    this.value,
    this.title,
    this.cardColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Card(
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 100.0,
                  height: 38.0,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      value.toString().replaceAllMapped(reg, mathFunc),
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 14.0),
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
