import 'package:flutter/material.dart';
import 'package:music_playeer_ui/model/song_model.dart';
import 'package:music_playeer_ui/playlist_card.dart';
import 'package:music_playeer_ui/song_card.dart';

import 'model/playlist_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Song> song=Song.song;
    List<PlayList> playlist=PlayList.playlist;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.purple.shade900,
            selectedItemColor: Colors.grey.shade100,
            unselectedItemColor: Colors.grey.shade100,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled,size: 30,),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle,size: 30,),label: "Play"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline,size: 30,),label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.settings,size: 30,),label: "Settings"),
        ]),
        backgroundColor: Colors.purple.shade700,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //app bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
              child: Row(
                children: [
                  Container(
                    height: 30,
                      child: Image.asset("lib/icons/men.png",color: Colors.grey.shade100,),
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 40,
                      color: Colors.cyan,
                      child: Image.asset("lib/icons/busi.png",color: Colors.grey.shade100,),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Welcome",style: TextStyle(fontSize: 20,color: Colors.grey.shade200),),
            ),
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text("Enjoy Your Favorite Music",style: TextStyle(fontSize: 26,color: Colors.grey.shade200),),
            ),
            //search bar
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12)
                ),
                padding: EdgeInsets.all(5),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search songs",
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon: Icon(Icons.search,size: 30,)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text("Trending Song",style: TextStyle(fontSize: 22,color: Colors.grey.shade100),),
                  Spacer(),
                  Text("View more",style: TextStyle(fontSize: 18,color: Colors.grey.shade400),)
                ],
              ),
            ),
            //song card
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: song.length,
                    itemBuilder: (context,index){
                  return SongCard(
                    song: song[index],
                  );
                }),
              ),
            ),
            
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text("Playlists",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Spacer(),
                  Text("See all",style: TextStyle(fontSize: 18,color: Colors.grey.shade400),)
                ],
              ),
            ),
            
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: playlist.length,
                padding: EdgeInsets.all(5),
                scrollDirection: Axis.vertical,
                  itemBuilder: (context,index){
                return PlayListCard(
                  playlist: playlist[index],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
