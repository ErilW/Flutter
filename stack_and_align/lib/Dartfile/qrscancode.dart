import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class Qrscann extends StatefulWidget {
  const Qrscann({super.key});

  @override
  State<Qrscann> createState() => _QrscannState();
}

class _QrscannState extends State<Qrscann> {
  String? text = "Hasil Qr Code";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text ?? "eril"),
          ElevatedButton(
            child: const Icon(Icons.scanner),
            onPressed: () async {
              text = await scanner.scan();
              setState(() {});
            },
          ),
        ],
      ),
    ));
  }
}
