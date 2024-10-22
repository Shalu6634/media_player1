import 'package:flutter/material.dart';
import 'package:media_player1/provider/song_provider.dart';
import 'package:media_player1/view/home_page.dart';
import 'package:media_player1/view/song_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SongProvider(),
      builder: (context, child) => MaterialApp(
        routes: {
          '/': (context) => SongPage(),
          '/song': (context) => SongPlayPage(),
        },
      ),
    );
  }
}
