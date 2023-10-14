import 'package:flutter/material.dart';

import 'layarutama.dart';

class Kartu extends StatelessWidget {
  const Kartu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Test Slicing",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.pink, Colors.orange],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft)),
          ),
        ),
        body: const Lisa());
  }
}

class Lisa extends StatelessWidget {
  const Lisa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pink, Colors.deepOrangeAccent],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomLeft)),
        ),
        Center(
            child: Card(
          color: Colors.orange[30],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAlias,
          elevation: 10,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.85,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: Image.network(
                      "https://asset.kompas.com/crops/8zZxCQ7_pluVMzSCJMkoD9pm3k4=/0x90:1080x810/750x500/data/photo/2021/09/17/6143ea78f17bd.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [colors[1], colors[4], colors[5]],
                          begin: FractionalOffset.topRight,
                          end: FractionalOffset.bottomLeft),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(flex: 3),
                        const Text(
                          "Lisa \n Member Of Blackpink ",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    blurRadius: 10.0,
                                    color: Colors.white70,
                                    offset: Offset(2.0, 2.0))
                              ]),
                        ),
                        const Spacer(flex: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Posted on ",
                              style: TextStyle(color: Colors.orange[200]),
                            ),
                            const Text(
                              "Oktober 11 2023",
                              style: TextStyle(color: Colors.black54),
                            ),
                          ],
                        ),
                        const Spacer(flex: 1),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(flex: 5),
                            Icon(
                              Icons.thumb_up_alt,
                            ),
                            Text(" 999", textAlign: TextAlign.start),
                            Spacer(),
                            Icon(Icons.comment),
                            Text(" 888"),
                            Spacer(flex: 5),
                          ],
                        ),
                        const Spacer(flex: 4)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ],
    );
  }
}
