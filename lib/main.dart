import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import './scoped-models/main.dart';
import './pages/offers.dart';
import './pages/article.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(context) {
    final MainModel model = MainModel();
    return ScopedModel<MainModel>(
      model: model,
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (BuildContext context) => OffersPage(model),
          '/offers': (BuildContext context) => OffersPage(model),
          '/articles': (BuildContext context) => ArticlesPage(model),
        },
      ),
    );
  }
}
