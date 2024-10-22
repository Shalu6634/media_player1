import 'package:flutter/material.dart';
import 'package:media_player1/provider/song_provider.dart';
import 'package:provider/provider.dart';

import '../modal/song_modal.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Song '),
      ),
      body: Provider.of<SongProvider>(context).songModal == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<SongProvider>(
              builder: (context, provider, child) => ListView.builder(
                itemCount: provider.songModal!.data.results.length,
                itemBuilder: (context, index) {
                  Result result = provider.songModal!.data.results[index];
                  return ListTile(
                    leading: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                   title: Text(result.name),
                    subtitle: Text(result.artists.toString()),

                  );
                }
              ),
            ),
    );
  }
}
