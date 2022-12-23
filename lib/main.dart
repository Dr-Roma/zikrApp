import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/loading.dart';
import 'screens/saved.dart';
import 'screens/settings.dart';

/*
fghgsth
*/

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: const Home(),
      theme: ThemeData(fontFamily: 'Gilroy'),
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/saved': (context) => const Saved(),
        '/settings': (context) => const Settings(),
      },
      initialRoute: '/',
    ),
  );
}
