//import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/zikr_hive_adapter.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/codegen_loader.g.dart';
import 'models/zikr.dart';
import 'screens/home/home.dart';
import 'screens/settings.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ZikrHiveAdapter());
  }

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ru')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    startLocale: const Locale('en'),
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
    return ChangeNotifierProvider(
      create: (context) => ProviderZikr(),
      lazy: false,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Gilroy'),
        routerConfig: _router,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}

class ProviderZikr extends ChangeNotifier {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  bool activity = true;
  final String keyCounter = 'counter';
  int counter = 0;
  bool loadingProvider = true;
  late Box<Zikr> savesZikrs;
  final player = AudioPlayer();
  final List<String> listSounds = [
    'sound-1.mp3',
    'sound-2.mp3',
    'sound-3.mp3',
    'sound-4.mp3',
    'sound-5.mp3',
    'sound-6.mp3'
  ];
  //AssetSource currentSound =AssetSource('sounds/sound-1.mp3');
  String selectedSound = 'sound-1.mp3';
  AssetSource currentSound = AssetSource('sound-1.mp3');

  bool togglePlayer = true;

  List<Zikr> listSaveZikrsFromHive = [];

  ProviderZikr() {
    preloadData();
  }

  Future<void> preloadData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(keyCounter)) counter = prefs.getInt(keyCounter)!;

    preloadZikrsFromHive();
    loadingProvider = false;

    notifyListeners();
  }

  Future<void> saveZikrToHive(Zikr zikr) async {
    await Hive.openBox<Zikr>('zikrs');
    Box<Zikr> boxZikrs = Hive.box<Zikr>('zikrs');
    boxZikrs.add(zikr);
    notifyListeners();
  }

  Future<void> preloadZikrsFromHive() async {
    await Hive.openBox<Zikr>('zikrs');
    Box<Zikr> boxZikrs = Hive.box<Zikr>('zikrs');
    listSaveZikrsFromHive = boxZikrs.values.toList();
    notifyListeners();
  }

  void toggleActivity(bool boolevo) {
    if (boolevo != activity) {
      activity = boolevo;
      notifyListeners();
    }
  }

  void toggleSound(bool toggle) async {
    final prefs = await SharedPreferences.getInstance();

    togglePlayer = toggle;

    prefs.setBool('togglePlayer', togglePlayer);
    notifyListeners();
  }

  void changeSound(int index) {
    currentSound = AssetSource(listSounds[index]);
    notifyListeners();
  }

  void playSound() async {
    if (togglePlayer) {
      await player.play(currentSound);
    }
  }

  void pushCount(int count) async {
    counter = count;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(keyCounter, counter);
    notifyListeners();
  }

  void delete(index) async {
    final savesZikr = Hive.box<Zikr>('zikrs');
    await savesZikr.deleteAt(index);
  }

  Future<void> metod() async {
    final SharedPreferences prefsSave = await prefs;
    prefsSave.setInt(keyCounter, counter);
  }

  void decrement() {
    if (counter > 0) {
      counter--;
      notifyListeners();
    }
    metod();
  }

  void increment() {
    counter++;
    notifyListeners();
    metod();
  }

  void zeroing() {
    if (counter > 0) {
      counter = 0;
    }
    metod();
    notifyListeners();
  }
}
