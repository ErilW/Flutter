import 'package:belajar_flutter/Dartfile/Layarutama.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Tabbarview extends StatefulWidget {
  const Tabbarview({super.key});

  @override
  State<Tabbarview> createState() => TabbarviewState();
}

class TabbarviewState extends State<Tabbarview> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colors[4],
          title: const Text("Belajar Tab"),
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.09),
            child: Container(
              color: colors[6],
              child: TabBar(
                  unselectedLabelStyle: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis),
                  labelColor: colors[1],
                  labelStyle: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      overflow: TextOverflow.ellipsis),
                  indicatorColor: colors[1],
                  automaticIndicatorColorAdjustment: true,
                  dividerColor: colors[5],
                  splashBorderRadius: BorderRadius.circular(10),
                  dragStartBehavior: DragStartBehavior.start,
                  isScrollable: false,
                  unselectedLabelColor: colors[7],
                  tabs: [
                    const Tab(
                        icon: Icon(
                          Icons.add,
                          textDirection: TextDirection.ltr,
                        ),
                        text: "add"),
                    const Tab(text: "Testing Teks"),
                    Tab(
                      child: Image.asset(".dart_tool/images/test.jpg"),
                    )
                  ]),
            ),
          ),
        ),
        body: const TabBarView(children: [
          //tab pertama
          Center(child: Text("Eril")),
          //tab Kedua
          Center(child: Text("Sanjaya")),
          //tab Ketiga
          Center(child: Text("Ganteng ")),
        ]),
      ),
    );
  }
}
