import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/main.dart';
import '../widgets/castings/castings.dart';

class OffersPage extends StatefulWidget {
  final MainModel model;

  OffersPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _OffersPageState();
  }
}

class _OffersPageState extends State<OffersPage> {
  @override
  void initState() {
    super.initState();
    widget.model.fetchCastings();
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

  Widget _buildCastingList() {
    print('yop');
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, MainModel model) {
        Widget content = Center(child: Text('No Product Found !'));
        if (model.displayedProducts.length > 0 && !model.isLoading) {
          content = Castings();
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
      body: _buildCastingList(),
    );
  }
}
