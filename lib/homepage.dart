// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/date_symbol_data_local.dart';


import 'package:intl/intl.dart' show DateFormat;
import 'package:permission_handler/permission_handler.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  FlutterSoundRecorder? _myrecorder;
  final audioPlayer = AssetsAudioPlayer();
  String? filePath;
  bool _play = false;

  void startIt()async{
    filePath = '/sdcard/Download/temp.wav';
    _myrecorder = FlutterSoundRecorder();
    await _myrecorder!.openAudioSession(
      focus: AudioFocus.requestFocusAndStopOthers,
      category: SessionCategory.playAndRecord,
      mode: SessionMode.modeDefault,
      device: AudioDevice.speaker
    );
    await _myrecorder!.setSubscriptionDuration(Duration(milliseconds: 10));
    await initializeDateFormatting();

    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();

  }
  @override
  void initState() {
    super.initState();
    startIt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Column(
        children: [
          Container(
            height:MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              // ignore: prefer_const_literals_to_create_immutables
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 2, 199, 256),
                    Color.fromARGB(255, 6, 75, 210),
                  ]),
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 100)),
            ),
            child: Center(
                child: Text(
              "data",
              style: TextStyle(fontSize: 70),
            )),
          ),
          SizedBox(
            height:MediaQuery.of(context).size.height*0.09,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: Icon(Icons.mic, color: Colors.red,),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2, color: Colors.orange),
                 shape: StadiumBorder(),
                ),
              ),
              SizedBox(width:30),
              OutlinedButton(
                onPressed: () {},
                child: Icon(Icons.stop, color: Colors.black,),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2, color: Colors.orange),
                  shape: StadiumBorder(),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: Icon(Icons.play_arrow, color: Colors.black,),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2, color: Colors.orange),
                  shape: StadiumBorder(),
                ),
              ),
              SizedBox(width: 30),
              OutlinedButton(
                
                onPressed: () {},
                child: Icon(Icons.stop, color: Colors.black,),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 2, color: Colors.orange),
                  
                  shape: StadiumBorder(),
                ),
              )
            ],
          ),
          SizedBox(
            height: 13,
          ),
          ElevatedButton.icon(onPressed: (){}, label: Text('Button'),icon: Icon(Icons.play_arrow),),
        ],
      ),
    );
  }
}
