import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:media_player1/provider/song_provider.dart';
import 'package:provider/provider.dart';

class SongPlayPage extends StatelessWidget {
  const SongPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    SongProvider songProvider = Provider.of<SongProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.white,
              size: 18,
            )),
        title: Text(
          songProvider.result!.name,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 19),
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Consumer<SongProvider>(
        builder: (context, provider, child) => SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              // FlutterCarousel.builder(
              //   itemCount: 3,
              //   itemBuilder: (BuildContext context, int index, int realIndex) {
              //     return Container(
              //       width: MediaQuery.of(context).size.width,
              //       margin: const EdgeInsets.symmetric(horizontal: 5.0),
              //       decoration: BoxDecoration(color: Colors.amber),
              //       child: Container(
              //         height: 200,
              //         width: 300,
              //         decoration: BoxDecoration(
              //           color: Colors.blue,
              //           borderRadius: BorderRadius.circular(5),
              //           image: DecorationImage(
              //             fit: BoxFit.cover,
              //             image: NetworkImage(provider
              //                 .songModal!.data.results[index].image[2].url),
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              //   options: FlutterCarouselOptions(autoPlay: false),
              // ),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(provider.result!.image[2].url),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    CupertinoIcons.backward_end,
                    color: Colors.white,
                    size: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await provider.playSong();
                      print('----------------------------------------------------------');
                    },
                    child: const Icon(
                      CupertinoIcons.play,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const Icon(
                    CupertinoIcons.forward_end,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
