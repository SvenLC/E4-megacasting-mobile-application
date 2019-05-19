import 'package:flutter/material.dart';

import '../../models/casting.dart';

class CastingCard extends StatelessWidget {
  final Casting casting;
  final int castingIndex;

  CastingCard(this.casting, this.castingIndex);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Text(casting.title),
        Text(casting.description),
        Text(casting.job),
        Text(casting.jobNumber.toString())
      ],
    ));
  }
}
