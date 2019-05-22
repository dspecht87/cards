import 'package:flutter/material.dart';
import 'package:bitcoin_cards/ui/common/GradientAppBar.dart';
import 'package:bitcoin_cards/ui/home/HomePageBody.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new GradientAppBar("History of Bitcoin"),
          new HomePageBody(),
        ],
      ),
    );
  }
}