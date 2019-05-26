import 'dart:async';

import 'package:flutter/material.dart';

import '../models/article.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage(this.article);

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
          title: Text('Articles'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10.0, left: 8.0),
              child: Text(
                article.title,
                textAlign: TextAlign.left,
                textScaleFactor: 1.4,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10.0, left: 8.0),
              child: Text(
                article.content,
                textAlign: TextAlign.left,
                textScaleFactor: 1.1,
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
