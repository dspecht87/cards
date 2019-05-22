import 'package:flutter/material.dart';
import 'package:bitcoin_cards/ui/home/HomePage.dart';
import 'package:bitcoin_cards/ui/detail/detail_page.dart';

void main() {
  // Routes.initRoutes();
  runApp(new MaterialApp(
    title: "History of Bitcoin",
    home: new HomePage(),
  ));
}