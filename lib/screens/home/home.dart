import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/locale_keys.g.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/screens/home/savesHive.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../models/zikr.dart';
import '../auth/account_screen.dart';
import '../auth/login_screen.dart';
import 'counter.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activity = context.watch<ProviderZikr>().activity;
    TextEditingController controller = TextEditingController();
    final counter = context.watch<ProviderZikr>().counter;
    final user = FirebaseAuth.instance.currentUser;

    final provaiderZikr = context.read<ProviderZikr>();
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
                              context.read<ProviderZikr>().toggleActivity(true);
                            },
                            child: Container(
                              height: 30,
                              width: 134,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: provaiderZikr.activity
                                    ? const Color.fromARGB(255, 2, 75, 202)
                                    : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  LocaleKeys.activity.tr(),
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
                              context
                                  .read<ProviderZikr>()
                                  .toggleActivity(false);
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
                                  LocaleKeys.saved.tr(),
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
                              if ((user == null)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AccountScreen()),
                                );
                              }
                            },
                            icon: Icon(
                              Icons.person,
                              color:
                                  (user == null) ? Colors.black : Colors.blue,
                            ))),
                    Container(
                        height: 38,
                        width: 54,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: IconButton(
                            onPressed: () {
                              context.go('/settings');
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
                        InkWell(
                          onTap: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text(LocaleKeys.saveDhikr.tr()),
                              content: TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  hintText:
                                      LocaleKeys.pleaseEnterAtTitleDhikr.tr(),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    LocaleKeys.cancel.tr(),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.read<ProviderZikr>()
                                      ..saveZikrToHive(Zikr(
                                          dateTime: DateTime.now(),
                                          counter: counter,
                                          title: controller.text))
                                      ..preloadZikrsFromHive()
                                      ..zeroing();
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    LocaleKeys.save.tr(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
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
                            child: Center(
                              child: Text(
                                LocaleKeys.saveDhikr.tr(),
                                style: const TextStyle(
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
              const SavesHive()
            ],
          ),
        ),
      ),
    );
  }
}
