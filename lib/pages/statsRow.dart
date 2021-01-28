import 'package:CovidTracker/pages/valueCards.dart';
import 'package:flutter/material.dart';

class StatsRow extends StatelessWidget {
  final Color cardColor1;
  final String title1;
  final int value1;
  final Color cardColor2;
  final String title2;
  final int value2;
  final Color cardColor3;
  final String title3;
  final int value3;

  StatsRow({
    this.cardColor1,
    this.title1,
    this.value1,
    this.cardColor2,
    this.title2,
    this.value2,
    this.cardColor3,
    this.title3,
    this.value3,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ValueCards(
          cardColor: cardColor1,
          title: title1,
          value: value1,
        ),
        ValueCards(
          cardColor: cardColor2,
          title: title2,
          value: value2,
        ),
        ValueCards(
          cardColor: cardColor3,
          title: title3,
          value: value3,
        ),
      ],
    );
  }
}
