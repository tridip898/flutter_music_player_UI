import 'package:flutter/material.dart';
import 'package:music_playeer_ui/model/playlist_model.dart';
import 'package:get/get.dart';

class PlayListCard extends StatelessWidget {
  final PlayList playlist;
  const PlayListCard({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.toNamed('/playlist',arguments: playlist);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
        child: Container(
          padding: EdgeInsets.all(10),
          height: 80,
          decoration: BoxDecoration(
              color: Colors.grey.shade500.withOpacity(0.18),
              borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        height: 70,
                        child: Image.asset(playlist.imgUrl)),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(playlist.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      Text('${playlist.song.length} songs',style: TextStyle(fontSize: 18,color: Colors.grey.shade400),)
                    ],
                  ),
                ],
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.play_circle,color: Colors.white,size: 30,))
            ],
          ),

        ),
      ),
    );
  }
}
