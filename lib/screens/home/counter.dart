import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/generated/locale_keys.g.dart';
import 'package:flutter_application_1/main.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  const Counter({
    super.key,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProviderZikr>();
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
              onTap: () => provider.decrement(),
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
              onTap: () {
                provider.togglePlayer
                    ? provider.player.play(provider.currentSound)
                    : null;
                provider.increment();
              },
              child: SizedBox(
                  height: 154,
                  width: 154,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const NewWidget(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          LocaleKeys.dhikr.tr(),
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
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
              onTap: () => provider.zeroing(),
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

class NewWidget extends StatelessWidget {
  const NewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = context.select((ProviderZikr value) => value.counter);
    return Text(
      counter.toString(),
      style: const TextStyle(
          fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
