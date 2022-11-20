import 'package:music_playeer_ui/model/song_model.dart';

class PlayList {
  final String title;
  final List<Song> song;
  final String imgUrl;

  PlayList(this.title, this.song, this.imgUrl);

  static List<PlayList> playlist = [
    PlayList("Rock", Song.song, "lib/images/music2.jpg"),
    PlayList("Romantic", Song.song, "lib/images/roman.jpg"),
    PlayList("Pop", Song.song, "lib/images/pop.jpg"),
    PlayList("Folk", Song.song, "lib/images/folk.jpg"),
    PlayList("Rap", Song.song, "lib/images/rap.jpg"),
  ];
}
