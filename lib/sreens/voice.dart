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
    flutterTts.speak(
        'Welcome to the Makerere Hostel Application.Now listen carefully,to find details about hostels in Kikoni,tap in the top left corner of your screen.For details about Hostels in Wandegeya,tap in the bottom left corner of your screen.For details about hostels located in Kikumi Kikumi,tap in the right bottom corner of the screen.Thank you ');
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
                child: Text(
                  'Kikoni',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 150), backgroundColor: Colors.white),
                onPressed: () {
                  flutterTts.setPitch(1);
                  flutterTts.setSpeechRate(0.5);
                  flutterTts.speak(
                      "Kikoni hostels.In Kikoni,there are quite many and nice hostels.Hostel one,Olympia hostel.This is a mixed hostel located in Makerere Kikoni with both single and double rooms.All their rooms are self contained.A single room per semester costs two point two million shillings and a double room goes up to one point one million shillings.This hostel offers really high quality services and among these include,a big parking,armed guards for security,a hostel shuttle,a saloon,a swimming pool and paid Wifi.If interested,the custodian's contact is 0,7,0,0,8,6,1,2,5,3");
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              child: ElevatedButton(
                child: Text(
                  'Wandegeya',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 150), backgroundColor: Colors.white),
                onPressed: () {
                  flutterTts.speak(
                      "Hostels located in Wandegeya,Hostel one,Aryan Hostel.This is a mixed hostel located along Nkiizi Road.It has both self contained, and afew rooms which are not self contained.A single room goes up to one point eight million shillings,a double room goes up to nine hundred fifty thousand shillings, whereas a triple room goes up to six hundred fifty shillings.Services offered at the hostel include a large parking space,a hostel shuttle,a gym to mention but a few.The custodian's contact is 0,7,7,2,4,3,1,7,3,3");
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: ElevatedButton(
                child: Text(
                  'Kikumi Kikumi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 150), backgroundColor: Colors.cyan),
                onPressed: () {
                  flutterTts.speak('Kikumi kikumi hostels');
                },
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: ElevatedButton(
                child: Text(
                  'Nankulabye lights',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 150), backgroundColor: Colors.cyan),
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
