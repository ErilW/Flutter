// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'Layarutama.dart';

class StackAndAlign extends StatefulWidget {
  const StackAndAlign({super.key});

  @override
  State<StackAndAlign> createState() => _StackAndAlignState();
}

class _StackAndAlignState extends State<StackAndAlign> {
  final _chars = '123456789';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Align And Stack"),
      ),
      body: Stack(
        children: [
          //BackGround
          Column(
            children: [
              Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Container(
                            color: colors[1],
                          )),
                      Flexible(
                          flex: 1,
                          child: Container(
                            color: colors[0],
                          ))
                    ],
                  )),
              Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Container(
                            color: colors[2],
                          )),
                      Flexible(
                          flex: 1,
                          child: Container(
                            color: colors[3],
                          ))
                    ],
                  ))
            ],
          ),
          //Tulisan
          ListView(
            children: [
              Column(
                children: [
                  Wrap(
                    children: [
                      Text(getRandomString(10000)),
                    ],
                  ),
                ],
              )
            ],
          ),
          //button
          Align(
              alignment: const Alignment(0, 0.4),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(colors[1]),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back Button")))
        ],
      ),
    );
  }
}
