import 'package:just_audio/just_audio.dart';

class AudioService
{
  static final player = AudioPlayer();

  static Future<Duration?> initAudio(String song)
  async {

    final Duration? duration = await player.setAsset(song);
    return duration;
  }
}