// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttHandler with ChangeNotifier {
  TextEditingController idController =
      TextEditingController(text: "erilsanjaya");
  TextEditingController brokerController =
      TextEditingController(text: "test.mosquitto.org");
  TextEditingController portController = TextEditingController(text: "1883");

  String _logData = "";
  String kosong = '';
  String get logdata => _logData;

  MqttHandler() {
    kosong = logdata;
  }

  void log(String message) {
    _logData += '$message\n';
    notifyListeners();
  }

  final ValueNotifier<String> data = ValueNotifier<String>("");
  late MqttServerClient client;

  Future<Object> connect() async { 
    var id = idController.text;
    var broker = brokerController.text;
    var port = int.parse(portController.text);

    client = MqttServerClient.withPort(broker, id, port);

    client.logging(on: true);
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.onUnsubscribed = onUnsubscribed;
    client.onSubscribed = onSubscribed;
    client.onSubscribeFail = onSubscribeFail;
    client.pongCallback = pong;
    client.keepAlivePeriod = 60;
    client.logging(on: true);

    /// Set the correct MQTT protocol for mosquito
    client.setProtocolV311();

    final connMessage = MqttConnectMessage()
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    log('MQTT_LOGS::Mosquitto client connecting....');

    client.connectionMessage = connMessage;
    try {
      await client.connect();
    } catch (e) {
      log('Exception: $e');
      client.disconnect();
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      log('MQTT_LOGS::Mosquitto client connected');
    } else {
      log('MQTT_LOGS::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
      return -1;
    }

    log('MQTT_LOGS::Subscribing to the test/lol topic');
    const topic = 'erilsanjaya/test';
    client.subscribe(topic, MqttQos.atMostOnce);

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      data.value = pt;
      notifyListeners();
      log('MQTT_LOGS:: New data arrived: topic is <${c[0].topic}>, payload is $pt');
      log('');
    });

    return client;
  }

  void onConnected() {
    log('MQTT_LOGS:: Connected');
  }

  void onDisconnected() {
    log('MQTT_LOGS:: Disconnected');
  }

  void onSubscribed(String topic) {
    log('MQTT_LOGS:: Subscribed topic: $topic');
  }

  void onSubscribeFail(String topic) {
    log('MQTT_LOGS:: Failed to subscribe $topic');
  }

  void onUnsubscribed(String? topic) {
    log('MQTT_LOGS:: Unsubscribed topic: $topic');
  }

  void pong() {
    log('MQTT_LOGS:: Ping response client callback invoked');
  }

  void publishMessage(String topic, String message) {
    final pubTopic = topic;
    final builder = MqttClientPayloadBuilder();
    builder.addString(message);

    if (client.connectionStatus?.state == MqttConnectionState.connected) {
      client.publishMessage(pubTopic, MqttQos.atMostOnce, builder.payload!);
    }
  }
}
