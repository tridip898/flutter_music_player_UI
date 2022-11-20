import 'package:flutter/material.dart';

import 'model/playlist_model.dart';
import 'model/song_model.dart';

class PlayMusic extends StatefulWidget {
  const PlayMusic({Key? key}) : super(key: key);

  @override
  State<PlayMusic> createState() => _PlayMusicState();
}

class _PlayMusicState extends State<PlayMusic> {
  bool isPlay = true;
  @override
  Widget build(BuildContext context) {
    PlayList playlist = PlayList.playlist[0];

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.deepPurple.shade700.withOpacity(0.8),
              Colors.deepPurple.shade200.withOpacity(0.8)
            ])),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Playlists"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          //extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //image
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  playlist.imgUrl,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //text title
              Text(
                playlist.title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              //shuffle switch
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPlay = !isPlay;
                    });
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 100),
                          left: isPlay
                              ? 0
                              : MediaQuery.of(context).size.width * 0.45,
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.deepPurple.shade400),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: Text(
                                    "Play",
                                    style: TextStyle(
                                        fontSize: 19,
                                        color: isPlay
                                            ? Colors.white
                                            : Colors.deepPurple),
                                  )),
                                  SizedBox(width: 10),
                                  Icon(Icons.play_circle,
                                      color: isPlay
                                          ? Colors.white
                                          : Colors.deepPurple)
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                      child: Text(
                                    "Shuffle",
                                    style: TextStyle(
                                        color: isPlay
                                            ? Colors.deepPurple
                                            : Colors.white,
                                        fontSize: 19),
                                  )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.shuffle,
                                    color: isPlay
                                        ? Colors.deepPurple
                                        : Colors.white,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),

              ListView.builder(
                  shrinkWrap: true,
                  itemCount: playlist.song.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple.shade700.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: ListTile(
                          leading: Text(
                            '${index + 1}',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          title: Text(playlist.song[index].title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          subtitle: Text(playlist.song[index].singer,style: TextStyle(fontSize: 17),),

                          trailing: Icon(Icons.more_vert,color: Colors.white,),
                        ),
                      ),
                    );
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
