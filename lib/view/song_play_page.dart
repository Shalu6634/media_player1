import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
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
      body:
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 360,
                width: 370,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(''),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding:  EdgeInsets.only(left: 10),
                  child: Text(
                    'title',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: Icon(
                       Icons.favorite,
                      size: 29,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      // Provider.of<SongProvider>(context,listen: false).toggleFavorite();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            // slider(context, songProvider),
            // sliderText(songProvider),

            const SizedBox(
              height: 15,
            ),
            // icons(songProvider),
          ],
        ),
      ),
    );
  }
}

int sliderValue = 0;
