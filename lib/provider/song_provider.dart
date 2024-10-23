import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:media_player1/api_helper/song_helper.dart';
import 'package:media_player1/modal/song_modal.dart';

class SongProvider extends ChangeNotifier
{
  SongModal? songModal;
  Result? result;
  Duration? duration;

  bool isPlay = false;
  AudioPlayer player = AudioPlayer();
  Future<void> getSong()
  async {
    ApiService apiService = ApiService();
    Map<String,dynamic> json = await apiService.fetchSong();
    songModal = SongModal.fromJson(json);
    notifyListeners();
  }


  void selectSong(Result selectedSong)
  {
    result = selectedSong;
    notifyListeners();
  }
 Future<void> setSong(String url)
 async {
  duration = await player.setUrl(url);
  notifyListeners();
 }

 Future<void> playSong()
 async {
   if(isPlay)
     {
       isPlay = false;
       await player.pause();
       print('======================================================');
       notifyListeners();
     }
   else
     {
       isPlay = true;
       await player.play();
       notifyListeners();
     }
 }
  SongProvider()
  {
    getSong();
  }
}