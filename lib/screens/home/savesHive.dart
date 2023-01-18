// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../models/zikr.dart';

class SavesHive extends StatelessWidget {
  const SavesHive({
    Key? key,
    required this.widthScreen,
    required this.savesZikrs, 
  }) : super(key: key);

  final double widthScreen;
  final Box<Zikr> savesZikrs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: widthScreen,
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
          Expanded(
            child: Container(
              width: widthScreen,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  //reverse: true,
                  itemCount: savesZikrs.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 49,
                      width: widthScreen,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 249, 246, 246),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: (widthScreen - 60) * 0.15,
                            child: Center(
                              child: Text(
                                savesZikrs.getAt(index)!.counter.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 2, 75, 202),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: (widthScreen - 60) * 0.48,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 20,
                                  width: 2,
                                  color: Colors.black12,
                                ),
                                Flexible(
                                  child: Text(
                                    savesZikrs.getAt(index)!.title,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: (widthScreen - 60) * 0.25,
                            child: Text(
                              DateFormat('dd.MM.yy (kk:mm)')
                                  .format(savesZikrs.getAt(index)!.dateTime),
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black54),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            width: (widthScreen - 60) * 0.12,
                            child: Image.asset(
                              'assets/images/ellipsis.png',
                              width: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                //zdes
              ),
            ),
          ),
        ],
      ),
    );
  }
}
