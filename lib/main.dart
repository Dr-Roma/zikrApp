import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/zikr_hive_adapter.dart';
// ignore: unnecessary_import
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/zikr.dart';
import 'screens/home/home.dart';
//import 'screens/loading.dart';
// import 'screens/saved.dart';
import 'screens/settings.dart';
// ignore: unused_import
import 'package:flutter_native_splash/flutter_native_splash.dart';

//Hive
//!Все базы данных могут сохранять простые типы данных (int, String и тд)
//по умолчанию Hive не умеют наши модели сохранять (сложные типы данных как наши классы User, Zikr и тд)
//Для сохранения сложные типы данных в Hive нужен АДАПТЕР( то есть его надо научит)
void main() async {
  //Инициируем Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //Регистрируем адаптер для Hive, чтобы сохранять свои Объекты
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ZikrHiveAdapter());
  }

  //Создал бокс с ключом , сюда все сохраняться будет
  await Hive.openBox<Zikr>('zikrs');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Gilroy'),
      routes: {
        '/home': (context) => const Home(),
        '/settings': (context) => const Settings(),
      },
      initialRoute: '/home',
    ),
  );
}
