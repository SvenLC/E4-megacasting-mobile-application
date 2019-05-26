import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/main.dart';
import '../widgets/articles/articles.dart';

class ArticlesPage extends StatefulWidget {
  final MainModel model;

  ArticlesPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _ArticlesPage();
  }
}

class _ArticlesPage extends State<ArticlesPage> {
  @override
  void initState() {
    super.initState();
    widget.model.fetchArticles();
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Menu'),
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Offres de castings'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/offers');
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Articles'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/articles');
            },
          ),
        ],
      ),
    );
  }

 Widget _buildArticleList() {
    print('yop');
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        Widget content = Center(child: Text('Aucun article trouvé'));
        if (model.displayedArticles.length > 0 && !model.isLoading) {
          content = Articles();
        } else if (model.isLoading) {
          content = Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(onRefresh: model.fetchCastings, child: content);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('MegaCasting'),
      ),
      body:
      GestureDetector(
        onTap: () {

        },
        child: _buildArticleList(),
      ) 
    );
  }
}
