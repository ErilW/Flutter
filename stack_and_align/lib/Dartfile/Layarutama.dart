import 'package:belajar_flutter/Dartfile/TabBarview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Container.dart';
import 'Icon.dart';
import 'CardList.dart';
import 'Textfield.dart';
import 'StackAlign.dart';
import 'Kartu.dart';
import 'Inkwells.dart';

List<Color> colors = [
  Colors.yellow,
  Colors.orange,
  Colors.deepOrange,
  Colors.pinkAccent,
  Colors.red,
  Colors.purple,
  Colors.indigo,
  Colors.blue,
  Colors.green,
];

class ButtonItemData {
  final String name;
  final Color color;
  final Function(BuildContext context) onPressed;

  ButtonItemData(
      {required this.name, required this.color, required this.onPressed});
}

class LayarUtama extends StatelessWidget {
  LayarUtama({super.key});

  final List<ButtonItemData> data2 = [
    ButtonItemData(
        name: "Container",
        color: colors[0],
        onPressed: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Contain()));
        }),
    ButtonItemData(
        name: "Icon",
        color: colors[1],
        onPressed: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const IconAction()));
        }),
    ButtonItemData(
        name: "Card",
        color: colors[3],
        onPressed: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CardList()));
        }),
    ButtonItemData(
        name: "Text Fields",
        color: colors[4],
        onPressed: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Teksfield()));
        }),
    ButtonItemData(
        name: "StackAlign",
        color: colors[5],
        onPressed: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StackAndAlign()));
        }),
    ButtonItemData(
        name: "Slicing",
        color: colors[6],
        onPressed: (BuildContext context) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Kartu()));
        }),
    ButtonItemData(
        name: "InkWells",
        color: colors[7],
        onPressed: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const InkWells()));
        }),
    ButtonItemData(
        name: "TabBar",
        color: colors[8],
        onPressed: (BuildContext context) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Tabbarview()));
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: data2.length,
      child: Scaffold(
          backgroundColor: Colors.blue.shade500.withOpacity(0.2),
          appBar: AppBar(
            bottom: TabBar(
                indicatorColor: Colors.transparent,
                automaticIndicatorColorAdjustment: true,
                dividerColor: colors[5],
                splashBorderRadius: BorderRadius.circular(10),
                dragStartBehavior: DragStartBehavior.start,
                // isScrollable: true,
                unselectedLabelColor: Colors.black54,
                tabs: const [
                  Tab(
                    icon: Icon(
                      Icons.school_outlined,
                    ),
                  ),
                  Tab(
                    icon: Icon(Icons.dangerous),
                  )
                ]),
            title: const Text("Belajar flutter"),
            flexibleSpace: Container(
              width: 500,
              height: 500,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                    Color.fromARGB(255, 20, 158, 112),
                    Color.fromARGB(255, 93, 0, 243)
                  ],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.topRight)),
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: data2.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(3),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(data2[index].color)),
                      onPressed: () {
                        data2[index].onPressed(context);
                      },
                      child: Text(data2[index].name,
                          style: const TextStyle(color: Colors.black)),
                    ),
                  );
                },
              ),
              Center(
                  child: Text("Under Developing",
                      style: TextStyle(
                        fontSize: data2.length.toDouble() + 20,
                        color: Colors.red.shade200,
                      )))
            ],
          )),
    );
  }
}
