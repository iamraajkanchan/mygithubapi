import 'package:flutter/material.dart';
import 'package:mygithubapi/homepage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Github App',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
    ),
    home: HomePage(title: 'Parse JSON data'),
  ));
}