import 'package:flutter/material.dart';
import 'layarutama.dart';

class InkWells extends StatefulWidget {
  const InkWells({super.key});

  @override
  State<InkWells> createState() => _InkWellsState();
}

class _InkWellsState extends State<InkWells> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("InkWells"),
          iconTheme: const IconThemeData(color: Colors.white38),
          actions: const [
            Icon(Icons.add),
          ],
        ),
        body: ListView(children: [
          Container(
              color: Colors.lime,
              width: 200,
              height: 200,
              // padding: EdgeInsets.all(10),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.indigo,
                ),
              )),
          Container(
              color: colors[7],
              width: 21100,
              height: 200,
              // padding: EdgeInsets.all(10),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  splashColor: colors[2],
                ),
              )),
          Container(
              color: colors[6],
              width: 21100,
              height: 200,
              // padding: EdgeInsets.all(10),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  splashColor: colors[3],
                ),
              )),
          Container(
              color: colors[2],
              width: 21100,
              height: 200,
              // padding: EdgeInsets.all(10),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  splashColor: colors[4],
                ),
              )),
          Container(
              color: colors[1],
              width: 21100,
              height: 200,
              // padding: EdgeInsets.all(10),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  splashColor: colors[5],
                ),
              )),
          Container(
              color: Colors.white,
              width: 200,
              height: 200,
              // padding: EdgeInsets.all(10),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.red,
                ),
              ))
        ]));
  }
}
