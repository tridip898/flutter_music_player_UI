import 'package:flutter/material.dart';
import 'package:music_playeer_ui/model/song_model.dart';
import 'package:get/get.dart';

class SongCard extends StatelessWidget {
  final Song song;
  const SongCard({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed('/song',arguments: song);
      },
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            //background image
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(song.coverUrl), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(15)),
            ),
            //text
            Container(
              height: 53,
              width: MediaQuery.of(context).size.width * 0.41,
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(10)
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(song.title,style: TextStyle(fontSize: 20,color: Colors.black87,fontWeight: FontWeight.bold,fontFamily: "Times New Roman"),),
                      Text(song.singer,style: TextStyle(fontSize: 16,color: Colors.lightGreen.shade900,fontWeight: FontWeight.bold,fontFamily: "Times New Roman"),)
                    ],
                  ),
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.play_circle,color: Colors.deepPurple,))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
