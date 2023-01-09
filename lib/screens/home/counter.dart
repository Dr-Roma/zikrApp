import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int counter;
  final Function increment;
  final Function decrement;
  final Function zeroing;

  const Counter({
    required this.counter,
    required this.decrement,
    required this.increment,
    required this.zeroing,
    super.key,
  });

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
              onTap: () => decrement(),
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
              onTap: () => increment(),
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
              onTap: () => zeroing(),
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
