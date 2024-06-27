import 'package:audioplayers/audioplayers.dart';
import 'package:safety/util/log_util.dart';

class AudioCacheUtils {
  static AudioPlayer? audioPlayer;

  static AudioCacheUtils? _instance;

  factory AudioCacheUtils() => _getInstance();

  AudioCacheUtils._internal();

  static AudioCacheUtils _getInstance() {
    audioPlayer ??= AudioPlayer();
    _instance ??= AudioCacheUtils._internal();
    return _instance!;
  }

  void startAudio(String url) async {
    if (audioPlayer != null) {
      audioPlayer!.play(UrlSource(url));
    } else {
      WanLog.e('播放器设置问题');
    }
  }
}
