import 'package:belajar_flutter/Dartfile/Mqtt/mqtt.dart';
import 'package:belajar_flutter/Dartfile/Mqtt/mqtthandler.dart';
import 'package:belajar_flutter/Dartfile/layarutama.dart';
import 'package:flutter/material.dart';

class MqttSetup extends StatefulWidget {
  const MqttSetup({super.key});

  @override
  State<MqttSetup> createState() => _MqttSetupState();
}

class _MqttSetupState extends State<MqttSetup> {
  DataSetup data = DataSetup();
  MqttHandler mqttHandler = MqttHandler();
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: data.visible,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(colors: colors, radius: 1)),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width * 0.97,
              height: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 7),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.15,
                      child: TextField(
                        controller: mqttHandler.idController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.perm_identity_outlined,
                              color: Colors.black,
                            ),
                            labelText: "Id",
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: colors[9]))),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.width * 0.15,
                      child: TextField(
                        controller: mqttHandler.brokerController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.topic,
                              color: Colors.black,
                            ),
                            labelText: "Topic",
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: colors[9]))),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.width * 0.15,
                      child: TextField(
                        controller: mqttHandler.portController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            icon: const Icon(
                              Icons.numbers,
                              color: Colors.black,
                            ),
                            labelText: "Port",
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: colors[9]))),
                      ),
                    ),
                    const Spacer(flex: 3),
                    ElevatedButton(
                        onPressed: () {
                          // topic
                          data.host = mqttHandler.brokerController.text;
                        },
                        child: const Icon(Icons.upload)),
                    const Spacer(flex: 4)
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
