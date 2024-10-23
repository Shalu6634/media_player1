import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_player1/provider/song_provider.dart';
import 'package:provider/provider.dart';

import '../modal/song_modal.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.more_vert,
              weight: 10,
              color: Colors.white,
            ),
          )
        ],
        title: const Text(
          '  My Song ',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Provider.of<SongProvider>(context).songModal == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<SongProvider>(
              builder: (context, provider, child) => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: CupertinoSearchTextField(
                          style: TextStyle(color: Colors.white),
                          itemColor: Colors.white,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 100),
                        child: Text(
                          'New Trending Songs',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: provider.songModal!.data.results.length,
                            itemBuilder: (context, index) {
                              Result result =
                                  provider.songModal!.data.results[index];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      provider.selectSong(result);
                                      Navigator.of(context).pushNamed('/song');
                                    },
                                    child: ListTile(
                                      leading: Container(
                                        height: 120,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                result.image[2].url),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        result.name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        result.artists.primary[0].name,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    thickness: 0.5,
                                    indent: 50,
                                    endIndent: 30,
                                  ),
                                ],
                              );
                            }),
                      ),
                    ],
                  )),
    );
  }
}
// FlutterCarousel.builder(
// itemCount: 3,
// itemBuilder:
// (BuildContext context, int index, int realIndex) {
// return Container(
// width:
// MediaQuery.of(context).size.width,
// margin: const EdgeInsets.symmetric(
// horizontal: 5.0),
// decoration:
// BoxDecoration(color: Colors.amber),
// child: Container(
// height: 200,
// width: 300,
// decoration: BoxDecoration(
// color: Colors.blue,
// borderRadius:
// BorderRadius.circular(5),
// image: DecorationImage(
// fit: BoxFit.cover,
// image: NetworkImage(provider
//     .songModal!
//     .data
//     .results[index]
//     .image[2]
//     .url),
// ),
// ),
// ),
// );
// }, options: FlutterCarouselOptions(autoPlay: false),
// ),
