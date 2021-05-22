import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({Key key}) : super(key: key);

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  AudioPlayer _player;

  @override
  void initState() {
    _player = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () async {
          final url = 'https://www.applesaucekids.com/sound%20effects/moo.mp3';
          await _player.setUrl(url);
          _player.play();
        },
        child: Text("Press"),
      ),
    );
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
