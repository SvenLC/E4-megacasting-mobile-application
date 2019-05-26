import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './casting_card.dart';
import '../../models/casting.dart';
import '../../scoped-models/main.dart';

class Castings extends StatelessWidget {
  Widget _buildCastingLists(List<Casting> castings) {
    Widget castingCards;
    if (castings.length > 0) {
      castingCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            CastingCard(castings[index], index),
        itemCount: castings.length,
      );
    } else {
      castingCards = Container();
    }
    return castingCards;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildCastingLists(model.displayedCastings);
      },
    );
  }
}
