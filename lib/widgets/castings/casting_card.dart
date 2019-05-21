import 'package:flutter/material.dart';

import '../../models/casting.dart';

class CastingCard extends StatelessWidget {
  final Casting casting;
  final int castingIndex;

  CastingCard(this.casting, this.castingIndex);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 5.0, left: 8.0),
          child: Text(
            casting.title,
            textAlign: TextAlign.left,
            textScaleFactor: 1.2,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 5.0, left: 8.0),
          child: Text(
            casting.datePublication,
            textAlign: TextAlign.left,
            textScaleFactor: 1.1,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 5.0, left: 8.0),
          child: Text(
            casting.description,
            textAlign: TextAlign.left,
            textScaleFactor: 1.1,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ],
    ));
  }
}
