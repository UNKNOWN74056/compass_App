import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class compass extends StatefulWidget {
  const compass({super.key});

  @override
  State<compass> createState() => _compassState();
}

class _compassState extends State<compass> {
  double heading = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 59, 90),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 44, 43, 42),
        title: const Text("Compass App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${heading.ceil()}",
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/cadrant.png"),
                    Transform.rotate(
                      angle: ((heading ?? 0) * (pi / 100) * -1),
                      child: Image.asset("assets/compass.png"),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
