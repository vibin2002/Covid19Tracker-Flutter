import 'package:flutter/material.dart';
import 'package:flutter_app/data_source.dart';
import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: primaryBlack
    ),
    home: HomePage(),
  ));
}

