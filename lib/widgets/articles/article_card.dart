import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../../models/article.dart';
import '../../scoped-models/main.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  final int articleIndex;

  ArticleCard(this.article, this.articleIndex);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed<bool>(
                context,
                '/article/' + model.allArticles[articleIndex].id,
              ),
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 5.0, left: 8.0),
                  child: Text(
                    article.title,
                    textAlign: TextAlign.left,
                    textScaleFactor: 1.2,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 5.0, left: 8.0),
                  child: Text(
                    article.content,
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
