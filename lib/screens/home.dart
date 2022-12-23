import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool activity = true;
  @override
  Widget build(BuildContext context) {
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
                        const Counter(),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
                      ],
                    )
                  : const SizedBox.shrink(),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 62,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                'Last saved dhikrs',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 2,
                                width: 80,
                                color: const Color.fromARGB(255, 2, 75, 202),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                    itemCount: 10,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: 49,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color.fromARGB(255, 249, 246, 246),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '14',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 2, 75, 202),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    const Text(
                                      'Name of the file dhikr',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    const Text(
                                      '19.02.2021',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                    Image.asset(
                                      'assets/images/ellipsis.png',
                                      width: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: 49,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color.fromARGB(255, 249, 246, 246),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '9',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 2, 75, 202),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    const Text(
                                      'Name of the file dhikr',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    const Text(
                                      '19.02.2021',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                    Image.asset(
                                      'assets/images/ellipsis.png',
                                      width: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: 49,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color.fromARGB(255, 249, 246, 246),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '15',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 2, 75, 202),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      height: 20,
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    const Text(
                                      'Name of the file dhikr',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    const Text(
                                      '19.02.2021',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                    Image.asset(
                                      'assets/images/ellipsis.png',
                                      width: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  //zdes
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

  Future<void> counterMinus() async {
    if (counter > 0) {
      final SharedPreferences prefsSave = await prefs;
      counter--;
      prefsSave.setInt(keyCounter, counter);
      setState(() {});
    }
  }

  Future<void> counterIncrement() async {
    final SharedPreferences prefsSave = await prefs;
    counter++;
    prefsSave.setInt(keyCounter, counter);
    setState(() {});
  }

  Future<void> counterRestart() async {
    if (counter > 0) {
      final SharedPreferences prefsSave = await prefs;
      setState(() {
        counter = 0;
        prefsSave.setInt(keyCounter, counter);
      });
    }
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
