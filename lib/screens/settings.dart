import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => SettingsPage();
}

class SettingsPage extends State<Settings> {
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        height: 38,
                        width: 54,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color.fromARGB(255, 2, 75, 202),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 700,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Column(
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    'Settings',
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
                                    width: 65,
                                    color:
                                        const Color.fromARGB(255, 2, 75, 202),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Container(
                          height: 49,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                              border: Border.all(
                                  width: 1,
                                  color: const Color.fromARGB(31, 63, 60, 60))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  'Language',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                                Text(
                                  'English',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 2, 75, 202)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 49,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromARGB(31, 63, 60, 60))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Vibration',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        'On',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 2, 75, 202)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Off',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                125, 62, 62, 63)),
                                      ),
                                    ],
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
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromARGB(31, 63, 60, 60))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Sound',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        'On',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 2, 75, 202)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Off',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                125, 62, 62, 63)),
                                      ),
                                    ],
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
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: Colors.white,
                                border: Border.all(
                                    width: 1,
                                    color:
                                        const Color.fromARGB(31, 63, 60, 60))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Count as volume keys',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        'On',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 2, 75, 202)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Off',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromARGB(
                                                125, 62, 62, 63)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
