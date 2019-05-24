import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../../models/casting.dart';
import '../../scoped-models/main.dart';

class CastingCard extends StatelessWidget {
  final Casting casting;
  final int castingIndex;

  CastingCard(this.casting, this.castingIndex);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed<bool>(
                context,
                '/casting/' + model.allCastings[castingIndex].id,
              ),
          child: Card(
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
            ),
          ),
        );
      },
    );
  }
}
