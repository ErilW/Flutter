import 'package:flutter/material.dart';

class IconAction extends StatefulWidget {
  const IconAction({super.key});

  @override
  State<IconAction> createState() => _IconActionState();
}

class _IconActionState extends State<IconAction> {
  Color warnaIcon = Colors.white;
  bool visible = false;
  String code = """
import 'package:flutter/material.dart';

class IconAction extends StatefulWidget {
  const IconAction({super.key});

  @override
  State<IconAction> createState() => _IconActionState();
}

class _IconActionState extends State<IconAction> {
  Color warnaIcon = Colors.white30;
  bool visible = false;
  String code = """
      """;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon + Gradient"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.abc),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                visible = !visible;
                if (visible == true) {
                  warnaIcon = Colors.blue;
                } else {
                  warnaIcon = Colors.white;
                }
              });
            },
            icon: Icon(Icons.code, color: warnaIcon),
          ),
        ],
        flexibleSpace: Container(
          width: 500,
          height: 500,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff0096ff), Color.fromARGB(255, 93, 0, 243)],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.topRight)),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  Color.fromARGB(255, 250, 0, 255),
                  Color.fromARGB(255, 0, 250, 255),
                  Color.fromARGB(255, 0, 0, 255)
                ],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: 'Jenny',
                    triggerMode: TooltipTriggerMode.longPress,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Image.asset(
                        ".dart_tool/images/test.jpg",
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                  Tooltip(
                    message: 'Lisa ',
                    triggerMode: TooltipTriggerMode.longPress,
                    padding: const EdgeInsets.all(10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Image(
                        image: AssetImage(
                          ".dart_tool/images/Lisa_BlackPink.jpg",
                        ),
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Visibility(
            visible: visible,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Adjust the width as needed
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.zero),
                      color: Colors.white30),
                ),
                Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Adjust the width as needed
                    height: MediaQuery.of(context)
                        .size
                        .height, // Adjust the height as needed
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SingleChildScrollView(
                      child: Wrap(
                        children: [
                          Text(
                            code,
                            style: const TextStyle(
                              fontFamily: 'Monospace',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

""";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Icon + Gradient + Visible"),
        leading: IconButton(
          tooltip: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.home),
        ),
        actions: [
          IconButton(
            tooltip: "Kode",
            onPressed: () {
              setState(() {
                visible = !visible;
                if (visible) {
                  warnaIcon = Colors.blue;
                } else {
                  warnaIcon = Colors.white;
                }
              });
            },
            icon: Icon(Icons.code, color: warnaIcon),
          ),
        ],
        flexibleSpace: Container(
          width: 500,
          height: 500,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff0096ff), Color.fromARGB(255, 93, 0, 243)],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.topRight)),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  Color.fromARGB(255, 250, 0, 255),
                  Color.fromARGB(255, 0, 250, 255),
                  Color.fromARGB(255, 0, 0, 255)
                ],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight)),
          ),
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Tooltip(
                      message: 'Jenny',
                      triggerMode: TooltipTriggerMode.longPress,
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Image.asset(
                          ".dart_tool/images/test.jpg",
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Tooltip(
                      message: 'Lisa ',
                      triggerMode: TooltipTriggerMode.longPress,
                      padding: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Image(
                          image: AssetImage(
                            ".dart_tool/images/Lisa_BlackPink.jpg",
                          ),
                          width: 200,
                          height: 200,
                        ),
                      ),
                    )
                  ]),
            ],
          ),
          Visibility(
            visible: visible,
            child: GestureDetector(
                onLongPress: () {
                  setState(() {
                    if (visible == true) {
                      visible = false;
                    }
                  });
                },
                onDoubleTap: () {
                  setState(() {
                    visible = !visible;
                    if (visible) {
                      warnaIcon = Colors.blue;
                    } else {
                      warnaIcon = Colors.white;
                    }
                  });
                },
                child: ListView(children: [
                  Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Adjust the width as needed
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.zero),
                        color: Colors.white30),

                    child: Container(
                        width: MediaQuery.of(context)
                            .size
                            .width, // Adjust the width as needed
                        height: MediaQuery.of(context)
                            .size
                            .height, // Adjust the height as needed
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SingleChildScrollView(
                          child: Wrap(
                            children: [
                              Text(
                                code,
                                style: TextStyle(
                                  backgroundColor: Colors.tealAccent.shade400
                                      .withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Monospace',
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                ])),
          )
        ],
      ),
    );
  }
}
