import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VoicePage extends StatefulWidget {
  const VoicePage({Key key}) : super(key: key);

  @override
  State<VoicePage> createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    welcomeMessage();
  }

  void welcomeMessage() {
    flutterTts.speak('Welcome');
  }

  FlutterTts flutterTts = FlutterTts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 10,
              child: ElevatedButton(
                child: Text('Kikoni'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 150), backgroundColor: Colors.cyan),
                onPressed: () {
                  flutterTts.setPitch(1);
                  flutterTts.setSpeechRate(0.5);
                  flutterTts.speak(
                      'Kikoni hostels.There is Dream world hostel which is nice i can assure you');
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              child: ElevatedButton(
                child: Text('Wandegeya'),
                style: ElevatedButton.styleFrom(minimumSize: Size(150, 150)),
                onPressed: () {
                  flutterTts.speak(
                      'Wandegeya hostels, There is Aryan Hostel which is located along Nkiizi road');
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: ElevatedButton(
                child: Text('Kikumi Kikumi'),
                style: ElevatedButton.styleFrom(minimumSize: Size(150, 150)),
                onPressed: () {
                  flutterTts.speak('Kikumi kikumi hostels');
                },
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: ElevatedButton(
                child: Text('Nankulabye lights'),
                style: ElevatedButton.styleFrom(minimumSize: Size(150, 150)),
                onPressed: () {
                  flutterTts.speak('Nankulabye hostels');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
