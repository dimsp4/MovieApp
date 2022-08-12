import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moviedb2/pages/detail.dart';
import 'package:moviedb2/pages/genre.dart';
import 'package:moviedb2/pages/home.dart';
import 'package:moviedb2/pages/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white70,
          displayColor: Colors.white70,
        ),
      ),
      routes: {
        'home': (context) => const Home(),
        'detail': (context) => const DetailNowPlaying(),
        'genre': (context) => GenrePage(),
        'search': (context) => SearchPage(),
      },
      home: Home(),
    );
  }
}
