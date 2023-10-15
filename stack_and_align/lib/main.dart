import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Dartfile/layarutama.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: true,
      home: const SandiPage(),
    );
  }
}

class SandiPage extends StatefulWidget {
  const SandiPage({super.key});

  @override
  State<SandiPage> createState() => _SandipageState();
}

class _SandipageState extends State<SandiPage> {
  TextInputAction testing = TextInputAction.next;
  TextEditingController id = TextEditingController(text: '');
  String buttonMasuk = "Eril , password";
  TextEditingController pass = TextEditingController(text: '');
  final bool text = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(clipBehavior: Clip.antiAlias, children: [
        Container(color: Colors.pink.shade100),
        //Bubble diatas
        Positioned(
          top: -MediaQuery.of(context).size.width * 1 / 2 / 3,
          right: -MediaQuery.of(context).size.width * 1 / 2 / 3,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.65,
            height: MediaQuery.of(context).size.width * 0.65,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 247, 0, 95),
                  Color.fromARGB(255, 194, 136, 204)
                ], end: Alignment.bottomRight, begin: Alignment.topLeft)),
          ),
        ),
        Positioned(
          top: -MediaQuery.of(context).size.width * 1 / 2 / 3,
          left: -MediaQuery.of(context).size.width * 1 / 2 / 3,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.width * 0.85,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 247, 0, 95),
                  Color.fromARGB(255, 194, 136, 204)
                ], end: Alignment.bottomRight, begin: Alignment.topLeft)),
            child: const Center(
                child: Text("Aplikasi \n    Flutter",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                        shadows: [
                          Shadow(
                              color: Colors.blue,
                              blurRadius: 10,
                              offset: Offset(2.0, 2))
                        ]))),
          ),
        ),

        // Textfieldnya
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.pink.withOpacity(0.5),
                border: Border.all(
                    color: Colors.black54, style: BorderStyle.solid)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: const EdgeInsets.all(10),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    controller: id,
                    onChanged: (value) {
                      setState(() {});
                    },
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                    decoration: const InputDecoration(
                      hintText: AutofillHints.name,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  margin: const EdgeInsets.all(10),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    onSubmitted: (value) {
                      setState(() {
                        if (id.text == 'Eril' && pass.text == "password") {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LayarUtama(),
                              ));
                        }
                      });
                    },
                    textInputAction: testing,
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: pass,
                    obscureText: true,
                    // maxLength: 50,
                    decoration: const InputDecoration(
                      hintText: AutofillHints.password,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ),
                Tooltip(
                  message: buttonMasuk,
                  child: ElevatedButton(
                      onLongPress: () {
                        setState(() {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LayarUtama(),
                              ));
                        });
                      },
                      onPressed: () {
                        setState(() {
                          if (id.text == 'Eril' && pass.text == "password") {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LayarUtama(),
                                ));
                          } else {
                            buttonMasuk = "False";
                            text == true;
                          }
                        });
                      },
                      style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(10),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.pink.shade500)),
                      child: const Text("       Log In       ")),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
