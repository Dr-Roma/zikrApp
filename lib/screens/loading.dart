import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => LoadingPage();
}

class LoadingPage extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 246, 246),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/home');
                  },
                  child: Image.asset(
                    'assets/images/loading.png',
                    width: 224,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Загрузка..',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
