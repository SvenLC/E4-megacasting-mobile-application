import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './article_card.dart';
import '../../models/article.dart';
import '../../scoped-models/main.dart';

class Articles extends StatelessWidget {
  Widget _buildArticleLists(List<Article> articles) {
    Widget articleCards;
    if (articles.length > 0) {
      articleCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ArticleCard(articles[index], index),
        itemCount: articles.length,
      );
    } else {
      articleCards = Container();
    }
    return articleCards;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildArticleLists(model.displayedArticles);
      },
    );
  }
}
