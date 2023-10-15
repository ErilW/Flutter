import 'package:belajar_flutter/Dartfile/Mqtt/mqtthandler.dart';
import 'package:belajar_flutter/Dartfile/layarutama.dart';
import 'package:flutter/material.dart';
// import 'package:mqtt_client/mqtt_server_client.dart';

class DataSetup {
  String id = " ", port = " ", host = " ";
  bool visible = false;
  DataSetup() {
    visible;
    id;
    port;
    host;
  }
}

class MyMqtt extends StatefulWidget {
  const MyMqtt({super.key});

  @override
  State<MyMqtt> createState() => _MyMqttState();
}

class _MyMqttState extends State<MyMqtt> {
  bool kode = false;
  MqttHandler mqttHandler = MqttHandler();
  TextEditingController messageController = TextEditingController();
  DataSetup data = DataSetup();
  @override
  void initState() {
    super.initState();
    mqttHandler.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text('Mqtt Test'), actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh)),
          IconButton(
            icon: const Icon(Icons.phonelink_setup),
            onPressed: () {
              setState(() {
                data.visible = !data.visible;
              });
            },
          ),
        ]),
        body: Stack(children: [
          inputmqtt(),
          kotakinput(context),
        ]));
  }

  Column inputmqtt() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Spacer(),
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.width * 0.20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                const Spacer(flex: 2),
                Text("Host: ${data.host}"),
                const Spacer(),
                Text("ID: ${data.id}"),
                const Spacer(),
                Text("Port: ${data.port}"),
                const Spacer(flex: 2),
              ]),
            ],
          )),
      const Spacer(),
      const Text('Data received:',
          style: TextStyle(color: Colors.black, fontSize: 25)),
      const Spacer(),
      ValueListenableBuilder<String>(
        valueListenable: mqttHandler.data,
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                  overflow: TextOverflow.ellipsis,
                  value,
                  style: const TextStyle(
                      color: Colors.deepPurpleAccent, fontSize: 35)),
              const Spacer(),
            ],
          );
        },
      ),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: <Widget>[
          Expanded(
            child: TextField(
              controller: messageController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Ketik pesan",
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              final message = messageController.text;
              if (message.isNotEmpty) {
                mqttHandler.publishMessage(message);
              }
            },
          ),
        ]),
      ),
      const Spacer(flex: 10),
    ]);
  }

  Visibility kotakinput(BuildContext context) {
    return Visibility(
        visible: data.visible,
        child: Stack(children: [
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
                          data.id = mqttHandler.idController.text;
                          data.port = mqttHandler.portController.text;
                          setState(() {
                            data.visible = !data.visible;
                          });
                        },
                        child: const Icon(Icons.upload)),
                    const Spacer(flex: 4)
                  ]),
            ),
          ),
        ]));
  }
}
