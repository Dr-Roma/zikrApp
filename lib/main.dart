import 'package:flutter/material.dart';
import 'screens/home.dart';
//import 'screens/loading.dart';
// import 'screens/saved.dart';
import 'screens/settings.dart';
// ignore: unused_import
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Gilroy'),
      routes: {
        //'/': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/settings': (context) => const Settings(),
      },
      initialRoute: '/home',
    ),
  );
}
