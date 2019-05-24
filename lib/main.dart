import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';
import './scoped-models/main.dart';
import './models/casting.dart';
import './pages/castings.dart';
import './pages/casting.dart';
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
          '/': (BuildContext context) => CastingsPage(model),
          '/offers': (BuildContext context) => CastingsPage(model),
          '/articles': (BuildContext context) => ArticlesPage(model),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'casting') {
            final String castingId = pathElements[2];
            final Casting casting =
                model.allCastings.firstWhere((Casting casting) {
              return casting.id == castingId;
            });
            model.selectCasting(castingId);
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => CastingPage(casting),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => CastingsPage(model),
          );
        },
      ),
    );
  }
}
