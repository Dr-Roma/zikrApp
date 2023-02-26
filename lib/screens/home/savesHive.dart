// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/generated/locale_keys.g.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/models/zikr.dart';
import 'package:provider/provider.dart';

class SavesHive extends StatelessWidget {
  const SavesHive({super.key});

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final listSaveZikrsFromHive =
        context.watch<ProviderZikr>().listSaveZikrsFromHive;

    List<Zikr> listSaveZikrsFromHiveK = listSaveZikrsFromHive.reversed.toList();
    TextEditingController controllerTitle = TextEditingController();
    TextEditingController controllerCounter = TextEditingController();

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
                        children: [
                          Text(
                            LocaleKeys.lastSavedDhikr.tr(),
                            style: const TextStyle(
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
                  itemCount: listSaveZikrsFromHiveK.length,
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
                                listSaveZikrsFromHiveK[index]
                                    .counter
                                    .toString(),
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
                                    listSaveZikrsFromHiveK[index].title,
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
                              DateFormat('dd.MM.yy (kk:mm)').format(
                                  listSaveZikrsFromHiveK[index].dateTime),
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black54),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          InkWell(
                            onTap: () => showDialog<String>(
                              context: context,
                              builder: (context) => Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        height: 375,
                                        width: widthScreen * 0.9,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Text(
                                                      LocaleKeys.editPost.tr(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Material(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  10)),
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 2, 75, 202),
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const SizedBox(
                                                            height: 35,
                                                            width: 35,
                                                            child: Icon(
                                                              Icons.close,
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  height: 45,
                                                  width: widthScreen,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    border: Border.all(
                                                        width: 2,
                                                        color: Colors.black45),
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      var index1 =
                                                          (listSaveZikrsFromHive
                                                                      .length -
                                                                  1) -
                                                              index;
                                                      context
                                                          .read<ProviderZikr>()
                                                        ..pushCount(
                                                            listSaveZikrsFromHiveK[
                                                                    index]
                                                                .counter)
                                                        ..delete(index1)
                                                        ..preloadZikrsFromHive();
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      LocaleKeys.continue1.tr(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                TextField(
                                                  controller: controllerCounter,
                                                  textCapitalization:
                                                      TextCapitalization.words,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly
                                                  ],
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              vertical: 15),
                                                      hintText: LocaleKeys
                                                          .changeQuantity
                                                          .tr(),
                                                      border: const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          borderSide: BorderSide(
                                                              width: 2,
                                                              color: Colors
                                                                  .black45))),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                TextField(
                                                  controller: controllerTitle,
                                                  textCapitalization:
                                                      TextCapitalization.words,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              vertical: 15),
                                                      hintText: LocaleKeys
                                                          .changeName
                                                          .tr(),
                                                      border: const OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          borderSide: BorderSide(
                                                              width: 2,
                                                              color: Colors
                                                                  .black45))),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  height: 45,
                                                  width: widthScreen,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    border: Border.all(
                                                        width: 2,
                                                        color: Colors.black45),
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      listSaveZikrsFromHive[
                                                                  index]
                                                              .counter =
                                                          int.tryParse(
                                                              controllerCounter
                                                                  .text)!;
                                                      listSaveZikrsFromHive[
                                                                  index]
                                                              .title =
                                                          controllerTitle.text;
                                                      context
                                                          .read<ProviderZikr>()
                                                          .preloadZikrsFromHive();
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      LocaleKeys.saveChanges
                                                          .tr(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  height: 45,
                                                  width: widthScreen,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                    color: Colors.red,
                                                    border: Border.all(
                                                        width: 2,
                                                        color: Colors.black45),
                                                  ),
                                                  child: TextButton(
                                                    onPressed: () {
                                                      var index1 =
                                                          (listSaveZikrsFromHive
                                                                      .length -
                                                                  1) -
                                                              index;
                                                      context
                                                          .read<ProviderZikr>()
                                                        ..delete(index1)
                                                        ..preloadZikrsFromHive();
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      LocaleKeys.deleteEntry
                                                          .tr(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              width: (widthScreen - 60) * 0.12,
                              child: Image.asset(
                                'assets/images/ellipsis.png',
                                width: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
