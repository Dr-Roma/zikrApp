import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter extends StatefulWidget {
  const Counter({
    Key? key,
  }) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final Future<SharedPreferences> prefs = SharedPreferences
      .getInstance(); //создаем экземпляр SharedPreferences.getInstance()
  final String keyCounter = 'counter';
  int counter = 0;

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
    super.initState();
  }

  Future<void> metod() async {
    final SharedPreferences prefsSave = await prefs;
    prefsSave.setInt(keyCounter, counter);
  }

  void counterMinus() {
    if (counter > 0) {
      counter--;
      setState(() {});
    }
    metod();
  }

  void counterIncrement() {
    counter++;
    setState(() {});
    metod();
  }

  void counterRestart() {
    if (counter > 0) {
      setState(() {
        counter = 0;
      });
    }
    metod();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 202,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Material(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: const Color.fromARGB(255, 2, 75, 202),
            child: InkWell(
              onTap: () => counterMinus(),
              child: const SizedBox(
                  height: 35,
                  width: 35,
                  child: Center(
                    child: Text(
                      '\u2013',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          ),
          Material(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: const Color.fromARGB(255, 2, 75, 202),
            child: InkWell(
              onTap: () => counterIncrement(),
              child: SizedBox(
                  height: 154,
                  width: 154,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        counter.toString(),
                        style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Dhikr',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  )),
            ),
          ),
          Material(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: const Color.fromARGB(255, 2, 75, 202),
            child: InkWell(
              onTap: () => counterRestart(),
              child: const SizedBox(
                  height: 35,
                  width: 35,
                  child: Icon(Icons.update, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
