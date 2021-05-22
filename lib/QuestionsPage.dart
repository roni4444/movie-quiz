import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key key}) : super(key: key);

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  DateTime now = DateTime.now();
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  AudioPlayer _player;
  int rndm = 0;
  String url;
  @override
  void initState() {
    Random random = Random(now.millisecond);
    rndm = random.nextInt(2);
    url = geturl(0);
    _controller = VideoPlayerController.network(url);
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    /* _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();
*/
    // Use the controller to loop the video.
    _controller.setLooping(true);

    _player = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*firestore
        .collection('Movie')
        .doc("Hollywood")
        .collection('Video')
        .where('ID', isEqualTo: 1)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        url = doc["Location"];
      });
    });
*/
    switch (0) {
      case 0:
        return Scaffold(
          appBar: AppBar(
            title: Text("url"),
          ),
          // Use a FutureBuilder to display a loading spinner while waiting for the
          // VideoPlayerController to finish initializing.
          body: FutureBuilder(
            future: _controller.initialize(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                return InteractiveViewer(
                  constrained: true,
                  boundaryMargin: EdgeInsets.all(9.0),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_controller),
                  ),
                );
              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          floatingActionButton: ElevatedButton(
            onPressed: () {
              // Wrap the play or pause in a call to `setState`. This ensures the
              // correct icon is shown.
              setState(() {
                if (url == null) {
                  url = geturl(0);
                }
                // If the video is playing, pause it.
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  // If the video is paused, play it.
                  _controller.play();
                }
              });
            },
            // Display the correct icon depending on the state of the player.
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
        break;
      case 1:
        return Scaffold(
          body: SafeArea(
            child: ElevatedButton(
              onPressed: () async {
                final url =
                    'https://www.applesaucekids.com/sound%20effects/moo.mp3';
                await _player.setUrl(url);
                _player.play();
              },
              child: Text("Press"),
            ),
          ),
        );
        break;
      case 2:
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Image.network(
                    "",
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : CircularProgressIndicator();
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final url =
                        'https://www.applesaucekids.com/sound%20effects/moo.mp3';
                    await _player.setUrl(url);
                    _player.play();
                  },
                  child: Text("Press"),
                ),
              ],
            ),
          ),
        );
        break;
      default:
        return Container();
        break;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _player.dispose();
    super.dispose();
  }

  String geturl(int x) {
    firestore
        .collection('Movie')
        .doc("Hollywood")
        .collection('Video')
        .where('ID', isEqualTo: 1)
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) async {
        return await firebase_storage.FirebaseStorage.instance
            .ref(
                'Movie/Hollywood/Video/Je Tore Pagol Bole - Indranil Sen - YouTube.mkv')
            .getDownloadURL();
      });
    });
  }
}
