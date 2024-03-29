import 'package:audioplayers/audioplayers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/service/zikr_hive_adapter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import 'generated/codegen_loader.g.dart';
import 'models/zikr.dart';
import 'screens/auth/account_screen.dart';
import 'screens/home/home.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/reset_password_screen.dart';
import 'screens/settings.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/verifity_email_screen.dart';
import 'service/firebase_stream.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  MobileAds.instance.initialize();
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

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const FirebaseStream();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const Home();
          },
        ),
        GoRoute(
          path: 'settings',
          builder: (BuildContext context, GoRouterState state) {
            return const Settings();
          },
        ),
        GoRoute(
          path: 'accountScreen',
          builder: (BuildContext context, GoRouterState state) {
            return const AccountScreen();
          },
        ),
        GoRoute(
            path: 'loginScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
            },
            routes: [
              GoRoute(
                path: 'signupScreen',
                builder: (BuildContext context, GoRouterState state) {
                  return const SignUpScreen();
                },
              ),
              GoRoute(
                path: 'resetPasswordScreen',
                builder: (BuildContext context, GoRouterState state) {
                  return const ResetPasswordScreen();
                },
              ),
              GoRoute(
                path: 'verifityEmailScreen',
                builder: (BuildContext context, GoRouterState state) {
                  return const VerifyEmailScreen();
                },
              ),
            ]),
      ],
    ),
  ],
);

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
  bool spisok = true;
  bool activity = true;
  final String keyCounter = 'counter';
  int counter = 0;
  bool accountSet = true;
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

  String selectedSound = 'sound-1.mp3';
  AssetSource currentSound = AssetSource('sound-1.mp3');
  Color selectedColor = Colors.blue;

  bool togglePlayer = true;
  bool toggleVibroPlay = true;
  bool hasVibro = true;
  List<bool> isSelected = List.filled(10, false);

  List<Zikr> listSaveZikrsFromHive = [];

  ProviderZikr() {
    preloadData();
  }

  Future<void> preloadData() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(keyCounter)) counter = prefs.getInt(keyCounter)!;

    if (prefs.containsKey('selectedSound')) {
      selectedSound = prefs.getString('selectedSound')!;
      currentSound = AssetSource(selectedSound);
    }

    if (prefs.containsKey('selectedColor')) {
      selectedColor = Color(prefs.getInt('selectedColor')!);
    }

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

  void toggleVibro(bool vibro) async {
    final prefs = await SharedPreferences.getInstance();

    toggleVibroPlay = vibro;

    prefs.setBool('toggleVibroPlay', toggleVibroPlay);
    notifyListeners();
  }

  void playVibro() async {
    if (toggleVibroPlay) hasVibro = await Vibration.hasVibrator() ?? false;

    if (hasVibro) Vibration.vibrate();
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

  void setSound(String sound) {
    selectedSound = sound;
    currentSound = AssetSource(sound);
    notifyListeners();
  }

  void onSoundSelected(int index, ProviderZikr provider) {
    isSelected = List.generate(isSelected.length, (i) => i == index);
    provider.setSound(provider.listSounds[index]);
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
