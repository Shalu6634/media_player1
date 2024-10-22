import 'package:flutter/cupertino.dart';
import 'package:media_player1/api_helper/song_helper.dart';
import 'package:media_player1/modal/song_modal.dart';

class SongProvider extends ChangeNotifier
{
  SongModal? songModal;

  Future<void> getSong()
  async {
    ApiService apiService = ApiService();
    Map<String,dynamic> json = await apiService.fetchSong();
    songModal = SongModal.fromJson(json);
    notifyListeners();
  }

  SongProvider()
  {
    getSong();
  }
}