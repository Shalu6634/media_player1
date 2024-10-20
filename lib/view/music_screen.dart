import 'package:flutter/material.dart';
import 'package:media_player1/service/song_service_page.dart';
import 'package:media_player1/view/song_play_page.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Page'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => ListTile(
          onTap: () async {
            await AudioService.initAudio('assets/song/Champion.mp3');
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SongPlayPage(),
              ),
            );
          },
          title: const Text('song name'),
          subtitle: const Text('singer name'),
        ),
      ),
    );
  }
}
