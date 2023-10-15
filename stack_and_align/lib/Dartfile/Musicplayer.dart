// import 'dart:io';

// ignore_for_file: file_names

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

class Musicplayer extends StatefulWidget {
  const Musicplayer({super.key});

  @override
  State<Musicplayer> createState() => _MusicplayerState();
}

class _MusicplayerState extends State<Musicplayer> {
  final audioPlayer = AudioPlayer();

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);

//from online

    // String url =
    //     'http://commondatastorage.googleapis.com/codeskulptor-assets/Epoq-Lepidoptera.ogg';
    // audioPlayer.setSourceUrl(url);

//from phone

    // final result = await FilePicker.platform.pickFiles();

    // if(result != null ){
    //   final file = File(result.files.single.path!);
    //   audioPlayer.setSourceUrl(file.path, isLocal = true);
    // }

//from assets
    final player = AudioCache(prefix: 'Music/');
    final url = await player.load('2002 - Anna-Marie.mp3');
    audioPlayer.setSourceUrl(url.path);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Music Video Player",
            textAlign: TextAlign.center,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRect(
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(".dart_tool/images/test.jpg",
                      width: double.infinity, height: 350, fit: BoxFit.cover),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text('😁 Testing Music',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 4,
                ),
                const Text("Jenny", style: TextStyle(fontSize: 20)),
                Slider(
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await audioPlayer.seek(position);
                      await audioPlayer.resume();
                    }),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTime(position)),
                        Text(formatTime(duration - position)),
                      ],
                    )),
                CircleAvatar(
                  radius: 35,
                  child: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () async {
                      if (isPlaying == true) {
                        await audioPlayer.pause();
                      } else {
                        setAudio();
                        // String url =
                        //     'http://commondatastorage.googleapis.com/codeskulptor-assets/Epoq-Lepidoptera.ogg';
                        // await audioPlayer.play(url as Source);
                      }
                    },
                  ),
                )
              ],
            )));
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes);
    final seconds = twoDigits(duration.inSeconds);

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }
}
