import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/zikr_hive_adapter.dart';
import 'package:go_router/go_router.dart';
// ignore: unnecessary_import
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: unused_import
import 'package:intl/date_symbol_data_file.dart';
// ignore: unused_import
import 'package:intl/date_symbol_data_local.dart';
import 'generated/codegen_loader.g.dart';
import 'models/zikr.dart';
import 'screens/home/home.dart';
//import 'screens/loading.dart';
// import 'screens/saved.dart';
import 'screens/settings.dart';
// ignore: unused_import
import 'package:flutter_native_splash/flutter_native_splash.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Home();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'settings',
          builder: (BuildContext context, GoRouterState state) {
            return const Settings();
          },
        ),
      ],
    ),
  ],
);

//Hive
//!Все базы данных могут сохранять простые типы данных (int, String и тд)
//по умолчанию Hive не умеют наши модели сохранять (сложные типы данных как наши классы User, Zikr и тд)
//Для сохранения сложные типы данных в Hive нужен АДАПТЕР( то есть его надо научит)
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // ignore: unused_local_variable
  var initializeDateFormatting = [const Locale('en'), const Locale('ru')];
  //Инициялизируем Hive
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //Регистрируем адаптер для Hive, чтобы сохранять свои Объекты
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ZikrHiveAdapter());
  }

  //Создал бокс с ключом , сюда все сохраняться будет
  await Hive.openBox<Zikr>('zikrs');

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ru')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    assetLoader: const CodegenLoader(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Gilroy'),
      routerConfig: _router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      // home: const Home();
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         localizationsDelegates: context.localizationDelegates,
//         supportedLocales: context.supportedLocales,
//         locale: context.locale,
//         home: const Home());
//   }
// }
