class Song {
  final String title;
  final String singer;
  final String url;
  final String coverUrl;

  Song(this.title, this.singer, this.url, this.coverUrl);

  static List<Song> song=[
    Song("Believer", "Imagine", "lib/audio/audio1.mp3", "lib/images/music1.jpg"),
    Song("Sorry", "Justin Bieber", "lib/audio/audio2.mp3", "lib/images/music2.jpg"),
    Song("Faded", "Alan Walker", "lib/audio/audio3.mp3", "lib/images/music4.jpg"),
    Song("Sugar", "Adam Levine", "lib/audio/audio4.mp3", "lib/images/music5.jpg"),
    Song("Attention", "Charlie Puth", "lib/audio/audio5.mp3", "lib/images/music6.jpg"),
  ];
}
