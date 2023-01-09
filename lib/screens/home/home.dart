import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/savesHive.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/zikr.dart';
import 'counter.dart';
//import 'package:intl/intl.dart';

final List<Zikr> zikrs = [
  Zikr(dateTime: DateTime.now(), counter: 11, title: 'Первый'),
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool activity = true;
  final Future<SharedPreferences> prefs = SharedPreferences
      .getInstance(); //создаем экземпляр SharedPreferences.getInstance()
  final String keyCounter = 'counter';
  int counter = 0;
  String titleZikr = '';

  late Box<Zikr> savesZikrs;

  Future<void> instanceDb() async {
    final SharedPreferences prefsSave = await prefs;

    if (prefsSave.getInt(keyCounter) == null) {
      prefsSave.setInt(keyCounter, 0);
    } else {
      counter = prefsSave.getInt(keyCounter)!;
    }
    setState(() {});
  }

  @override
  void initState() {
    instanceDb();
    savesZikrs = Hive.box<Zikr>('zikrs');
    super.initState();
  }

  Future<void> metod() async {
    final SharedPreferences prefsSave = await prefs;
    prefsSave.setInt(keyCounter, counter);
  }

  void decrement() {
    if (counter > 0) {
      counter--;
      setState(() {});
    }
    metod();
  }

  void increment() {
    counter++;
    setState(() {});
    metod();
  }

  void zeroing() {
    if (counter > 0) {
      setState(() {
        counter = 0;
      });
    }
    metod();
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 246),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 38,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 38,
                      width: 276,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              activity = true;
                              setState(() {});
                            },
                            child: Container(
                              height: 30,
                              width: 134,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: activity
                                    ? const Color.fromARGB(255, 2, 75, 202)
                                    : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  'Activity',
                                  style: TextStyle(
                                      color: activity
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              activity = false;
                              setState(() {});
                            },
                            child: Container(
                              height: 30,
                              width: 134,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: activity
                                    ? Colors.white
                                    : const Color.fromARGB(255, 2, 75, 202),
                              ),
                              child: Center(
                                child: Text(
                                  'Saved',
                                  style: TextStyle(
                                      color: activity
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 38,
                        width: 54,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/settings');
                            },
                            icon: const Icon(Icons.menu))),
                  ],
                ),
              ),
              activity
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Counter(
                          counter: counter,
                          decrement: decrement,
                          increment: increment,
                          zeroing: zeroing,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Save dhikr'),
                              content: TextField(
                                onChanged: (value) {
                                  titleZikr = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Please enter a title Dhikr',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text(
                                    'Cancel',
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    savesZikrs.add(Zikr(
                                        dateTime: DateTime.now(),
                                        counter: counter,
                                        title: titleZikr));
                                    Navigator.pop(context, 'Save');
                                    setState(() {});
                                  },
                                  child: const Text(
                                    'Save',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                'Save dhikr',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 2, 75, 202),
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 15,
              ),
              SavesHive(widthScreen: widthScreen, savesZikrs: savesZikrs),
            ],
          ),
        ),
      ),
    );
  }
}



//  Expanded(
//                 child: Column(
//                   children: [
//                     Text(savesZikrs.length.toString()),
//                     Text(savesZikrs.values.toList()[0].title),
//                   ],
//                 ),

//                 //Saves()
//               )