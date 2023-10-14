import 'package:flutter/material.dart';

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Widget"),
      ),
      backgroundColor: Colors.green,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexSelected,
          onTap: (value) {
            setState(() {
              indexSelected = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Back",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Gak Ada")
          ]),
      body: Center(
        child: ListView(
          children: [
            buildCard(
                "Eril", const Color.fromARGB(255, 46, 171, 123), Icons.abc),
            buildCard(
                "Test", const Color.fromARGB(255, 70, 150, 200), Icons.home)
          ],
        ),
      ),
    );
  }

  Widget buildCard(
    String text,
    Color colors,
    IconData icons,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Card(
        child: Row(
          children: [
            Container(
              color: colors,
              margin: const EdgeInsets.all(5),
              child: Icon(icons),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}
