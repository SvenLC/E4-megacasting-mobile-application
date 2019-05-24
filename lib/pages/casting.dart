import 'dart:async';

import 'package:flutter/material.dart';

import '../models/casting.dart';

class CastingPage extends StatelessWidget {
  final Casting casting;

  CastingPage(this.casting);

  @override
  Widget build(BuildContext context) {
    print('hey');
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Offre de casting' + casting.job),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10.0, left: 8.0),
              child: Text(
                casting.title,
                textAlign: TextAlign.left,
                textScaleFactor: 1.4,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10.0, left: 8.0),
              child: Text(
                'Date de publication : ' + casting.datePublication,
                textAlign: TextAlign.left,
                textScaleFactor: 1.2,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10.0, left: 8.0),
              child: Text(
                casting.description,
                textAlign: TextAlign.left,
                textScaleFactor: 1.1,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 15.0, left: 8.0),
              child: Text(
                'Contact :  \n\n' +
                casting.contact,
                textAlign: TextAlign.left,
                textScaleFactor: 1.1,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              margin: EdgeInsets.only(bottom: 25.0),
            )
          ],
        ),
      ),
    );
  }
}
