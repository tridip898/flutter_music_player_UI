import 'package:flutter/material.dart';
import 'package:music_playeer_ui/play_list.dart';
import 'package:music_playeer_ui/play_music.dart';

import 'homepage.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      getPages: [
        GetPage(name: '/', page: ()=>HomePage()),
        GetPage(name: '/song', page: ()=>PlayList()),
        GetPage(name: '/playlist', page: ()=>PlayMusic()),
      ],
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.grey.shade100,
          displayColor: Colors.grey.shade100
        )
      ),
    );
  }
}

