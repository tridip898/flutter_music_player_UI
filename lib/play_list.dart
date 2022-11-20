import 'package:flutter/material.dart';
import 'package:music_playeer_ui/seekbardata.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import 'model/song_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';

class PlayList extends StatefulWidget {
  const PlayList({Key? key}) : super(key: key);

  @override
  State<PlayList> createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  AudioPlayer audioPlayer = AudioPlayer();
  Song song = Get.arguments ?? Song.song[0];
  @override
  void initState() {
    super.initState();
    audioPlayer.setAudioSource(
        ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
              Uri.parse('audio:///${song.url}')
          ),
        ]
        )
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream,
          (Duration position, Duration? duration) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                song.coverUrl,
                fit: BoxFit.cover,
              )),
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, iconSize: 50, icon: Icon(Icons.arrow_back_ios,)),
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.4),
                    Colors.white.withOpacity(0.0),
                  ],
                  stops: [
                    0.0,
                    0.4,
                    0.6
                  ]).createShader(rect);
            },
            blendMode: BlendMode.dstOut,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.deepPurple.shade200,
                    Colors.deepPurple.shade800
                  ])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 40
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(song.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text(song.singer,style: TextStyle(fontSize: 18,color: Colors.grey.shade300),),
                SizedBox(height: 30,),
                StreamBuilder<SeekBarData>(
                    stream: _seekBarDataStream,
                    builder: (context, snapshot) {
                      final positionData = snapshot.data;
                      return SeekBar(
                        position: positionData?.position ?? Duration.zero,
                        duration: positionData?.duration ?? Duration.zero,
                        onChangeEnd: audioPlayer.seek,
                      );
                    }),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StreamBuilder<SequenceState?>(
                        stream: audioPlayer.sequenceStateStream,
                        builder: (context, index) {
                          return IconButton(
                              onPressed: audioPlayer.hasPrevious
                                  ? audioPlayer.seekToPrevious
                                  : null,
                              iconSize: 45,
                              icon: Icon(
                                Icons.skip_previous,
                                color: Colors.white,
                              ));
                        }),
                    StreamBuilder<PlayerState>(
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final playerState = snapshot.data;
                          final processingState = playerState!.processingState;

                          if (processingState == ProcessingState.loading ||
                              processingState == ProcessingState.buffering) {
                            return Container(
                              width: 64,
                              height: 64,
                              margin: EdgeInsets.all(10),
                              child: CircularProgressIndicator(),
                            );
                          } else if (!audioPlayer.playing) {
                            return IconButton(
                                onPressed: audioPlayer.play,
                                iconSize: 75,
                                icon: Icon(
                                  Icons.play_circle,
                                  color: Colors.white,
                                ));
                          } else if (processingState !=
                              ProcessingState.completed) {
                            return IconButton(
                                onPressed: audioPlayer.pause,
                                iconSize: 75,
                                icon: Icon(
                                  Icons.pause_circle,
                                  color: Colors.white,
                                ));
                          } else {
                            return IconButton(
                                onPressed: () => audioPlayer.seek(Duration.zero,
                                    index: audioPlayer.effectiveIndices!.first),
                                iconSize: 75,
                                icon: Icon(
                                  Icons.replay_circle_filled_outlined,
                                  color: Colors.white,
                                ));
                          }
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                      stream: audioPlayer.playerStateStream,
                    ),
                    StreamBuilder<SequenceState?>(
                        stream: audioPlayer.sequenceStateStream,
                        builder: (context, index) {
                          return IconButton(
                              onPressed: audioPlayer.hasNext
                                  ? audioPlayer.seekToNext
                                  : null,
                              iconSize: 45,
                              icon: Icon(
                                Icons.skip_next,
                                color: Colors.white,
                              ));
                        }),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.settings,color: Colors.white,size: 35,)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.cloud_download_outlined,color: Colors.white,size: 35,))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
