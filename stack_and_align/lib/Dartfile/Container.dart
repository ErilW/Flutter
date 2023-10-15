// ignore_for_file: file_names

import 'package:belajar_flutter/Dartfile/Layarutama.dart';
import 'package:flutter/material.dart';

class Contain extends StatefulWidget {
  const Contain({super.key});

  @override
  State<Contain> createState() => _ContainState();
}

class _ContainState extends State<Contain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Container")),
      body: Container(
        decoration: BoxDecoration(
            color: colors[1], borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
              decoration: BoxDecoration(
                  color: colors[2],
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.black)),
              width: 500,
              height: 600,
              padding: const EdgeInsets.all(20),
              child: Container(
                  decoration: BoxDecoration(
                      color: colors[3],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100))),
                  width: 300,
                  height: 150,
                  padding: const EdgeInsets.all(100))),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            setState(() {});
          },
          child: const Icon(Icons.add)),
    );
  }
}
