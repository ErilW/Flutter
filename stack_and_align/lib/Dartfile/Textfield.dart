import 'package:flutter/material.dart';

class Teksfield extends StatefulWidget {
  const Teksfield({super.key});

  @override
  State<Teksfield> createState() => _TeksfieldState();
}

class _TeksfieldState extends State<Teksfield> {
  TextEditingController controller = TextEditingController(text: "Awalan");
  String? testing;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Text field"),
        ),
        body: StreamBuilder<Object>(
            stream: null,
            builder: (context, snapshot) {
              return Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: controller,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          testing = controller.text;
                        });
                      },
                      child: const Text("Simpan ke Variabel"),
                    ),
                    Container(
                        margin: const EdgeInsets.all(10),
                        color: Colors.green,
                        child: Text(
                          controller.text,
                          style: const TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 50,
                        )),
                    Container(
                      margin: const EdgeInsets.all(10),
                      color: Colors.red,
                      child: Text(
                        testing ?? '',
                        style: const TextStyle(fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 50,
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
