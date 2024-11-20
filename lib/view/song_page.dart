import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_player1/provider/search_provider.dart';
import 'package:media_player1/provider/song_provider.dart';
import 'package:provider/provider.dart';

class SongPlayPage extends StatelessWidget {
  const SongPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    SongProvider songProvider = Provider.of<SongProvider>(context);
    SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    void changeSong(double first, double second) async {
      if (songProvider.repeatSong == true) {
        if (first == second) {
          final data =
              songProvider.songModal!.data.results[songProvider.nextSong];
          songProvider.selectSong(data);
          await songProvider.setSong(data.downloadUrl[1].url);
          songProvider.player.play();
          songProvider.isPlay = true;
        }
      } else {
        if (first == second) {
          final data =
              songProvider.songModal!.data.results[songProvider.nextSong];
          songProvider.selectSong(data);
          await songProvider.setSong(data.downloadUrl[1].url);
          songProvider.player.play();
          songProvider.isPlay = true;

          songProvider.nextSong = songProvider.nextSong + 1;
        }
      }
    }
    num checkSong(double firstSong, double secondSong) {
      changeSong(firstSong, secondSong);
      return secondSong;
    }

    return Scaffold(
      backgroundColor: const Color(0xff1d0630),
      appBar: AppBar(
        backgroundColor: const Color(0xff1d0630),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
              size: 18,
            )),
        title: Text(
          songProvider.result!.name,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(
                searchProvider.isLike
                    ? Icons.favorite_border
                    : Icons.favorite,
                size: 29,
                color: Colors.red,
              ),
              onPressed: () {
                Provider.of<SearchProvider>(context,listen: false).favorite();
              },
            ),
          ),
        ],
      ),
      body: Consumer<SongProvider>(
        builder: (context, provider, child) => SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(provider.result!.image[2].url),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              StreamBuilder(
                stream: provider.getCurrentPosition(),
                builder: (context, snapshot) => (snapshot.data == null)
                    ? const Text(' ')
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                songProvider.result!.name,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Container(
                            height: 10,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Slider(
                              max: provider.duration!.inSeconds.toDouble(),
                              value: snapshot.data!.inSeconds.toDouble(),
                              onChanged: (value) {
                                provider
                                    .jumpSong(Duration(seconds: value.toInt()));
                              },
                            ),
                          ),
                          const SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${snapshot.data!.inSeconds.toDouble()}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  '${(provider.duration!.inSeconds.toDouble())}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  const Icon(
                    CupertinoIcons.shuffle,
                    color: Colors.white,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () async {
                      final data = provider.songModal!.data.results[provider.nextSong];
                      provider.selectSong(data);
                      await provider.setSong(data.downloadUrl[1].url);
                      provider.player.play();
                      provider.isPlay = true;
                      provider.nextSong = provider.nextSong;
                    },
                    child: const Icon(
                      CupertinoIcons.backward_end,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Container(
                    height: 65,
                    width: 65,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff1d0630),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white12,
                              blurRadius: 8,
                              spreadRadius: 5)
                        ]),
                    alignment: Alignment.center,
                    child: IconButton(
                        onPressed: () {
                          provider.checkSong();
                        },
                        icon: (provider.isPlay == true)
                            ? const Icon(
                                CupertinoIcons.pause,
                                color: Colors.white,
                                size: 40,
                              )
                            : const Icon(
                                CupertinoIcons.play,
                                color: Colors.white,
                                size: 35,
                              )),
                  ),
                  InkWell(
                    onTap: () async {
                      final data = provider.songModal!.data.results[provider.nextSong+1];
                      provider.selectSong(data);
                      await provider.setSong(data.downloadUrl[1].url);
                      provider.player.play();
                      provider.isPlay = true;
                      provider.nextSong = provider.nextSong+1;
                    },
                    child: const Icon(
                      CupertinoIcons.forward_end,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    CupertinoIcons.repeat,
                    color: Colors.white,
                  ),
                  const Spacer(),
                ],
              )
            ],
          ),
        ),
      ),


    );
  }
}
