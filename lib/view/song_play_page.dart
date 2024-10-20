import 'package:flutter/material.dart';
import 'package:media_player1/service/song_service_page.dart';

class SongPlayPage extends StatefulWidget {
  const SongPlayPage({super.key});

  @override
  State<SongPlayPage> createState() => _SongPlayPageState();
}

class _SongPlayPageState extends State<SongPlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Song Page'),
      ),
      body: Center(
        child: Row(
          children: [
            IconButton(
              onPressed: () async {
                await AudioService.player.play;
              },
              icon: Icon(Icons.play_arrow),
            ),
            IconButton(
              onPressed: () async {
                await AudioService.player.pause();
              },
              icon: Icon(Icons.pause),
            ),
          ],
        ),
      ),
    );
  }
}
