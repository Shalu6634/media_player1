import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_player1/provider/song_provider.dart';

import 'package:provider/provider.dart';

import '../provider/search_provider.dart';
import 'home_page.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchProvider>(context);
    var songProvider = Provider.of<SongProvider>(context);
    return
      Scaffold(
        backgroundColor: Color(0xff1d0630),
        appBar: AppBar(
          leading: GestureDetector(onTap: (){
            Navigator.of(context).pop();
          },child: const Icon(Icons.arrow_back,size: 19,color: Colors.white,)),

          backgroundColor: Color(0xff1d0630),
          title: Text('Search Song',style: TextStyle(color: Colors.white),),
        ),
        body: Column(
          children: [

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: txtSearch,
                style: TextStyle(color: Colors.white),
                onChanged: (value) async {
                  provider.searchSong(value);
                  await provider.getDataApi();
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () async {
                        provider.searchSong('');
                        await provider.getDataApi();
                        txtSearch.clear();
                      },
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: Colors.white,
                      )),
                  hintText: 'Search song here',
                  hintStyle: TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.white54, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
            Consumer<SearchProvider>(
              builder: (context, provider, child) => (provider.searchSongModel ==
                  null ||
                  provider.search == '' && provider.searchList.isEmpty)
                  ? const Column(
                children: [
                  SizedBox(
                    height: 270,
                  ),
                  Text(
                    'Search for artists, songs\nand more.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
                  : (provider.search != '')
                  ? Expanded(
                  child: ListView.builder(
                    itemCount: provider.searchSongModel!.data.results.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = provider.searchSongModel!.data.results;
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ListTile(
                          onTap: () async {
                            provider.searchList.add(data[index]);
                            songProvider.setSongResult(data[index]);
                            await songProvider
                                .setSong(data[index].downloadUrl[1].url);
                            songProvider.player.play();
                            songProvider.isPlay = true;
                            songProvider.nextSong = index;

                            provider.searchSong('');
                            provider.getDataApi();
                            txtSearch.clear();
                          },
                          leading: Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                image: NetworkImage(
                                    data[index].image[2].url),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            data[index].name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          subtitle: Text(
                            'Singer - ${data[index].artists.primary[0].name}',
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    },
                  ))
                  : Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Text(
                        'Recent Searches',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      provider.searchList.length,
                          (index) => Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ListTile(
                          onTap: () async {
                            final data = provider.searchList[index];
                            songProvider.setSong(data);
                            await songProvider.setSong(data.downloadUrl[1].url);
                            songProvider.player.play();
                            songProvider.isPlay = true;
                            songProvider.nextSong = index;
                          },
                          leading: Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${provider.searchList[index].image[2].url}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            '${provider.searchList[index].name}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                          subtitle: Text(
                            'Singer - ${provider.searchList[index].artists.primary[0].name}',
                            style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                provider.removeData(index);
                              },
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }
}

// var txtSearch = TextEditingController();
