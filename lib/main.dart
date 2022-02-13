import 'package:flutter/material.dart';
import 'package:wallpaper_ground/constants.dart';
import 'package:wallpaper_ground/homapage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper Ground',
      theme: ThemeData(
        backgroundColor: Constants.White,
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
