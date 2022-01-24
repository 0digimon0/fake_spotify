import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

part 'audio_state.dart';
part 'audio_event.dart';

const kUrl1 = 'assets/audio/mp3_scifi_robot.mp3';
const kUrl2 = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
const kUrl3 = 'http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p';

class AudioBloc extends Bloc<AudioEvent, AudioState> {
  AudioBloc() : super(AudioInitialState());

  AudioCache audioCache = AudioCache();
  AudioPlayer advancedPlayer = AudioPlayer();
  String? localFilePath;
  String? localAudioCacheURI;

  AudioPlayer _audioPlayer = AudioPlayer();
  PlayerState? _audioPlayerState;

  @override
  Stream<AudioState> mapEventToState(AudioEvent event) async* {
    debugPrint("AudioBloc mapEventToState");
    if (event is PrepareEvent) {
      if (Platform.isIOS) {
        audioCache.fixedPlayer?.notificationService.startHeadlessService();
      }
      prepareAudio();
      debugPrint("AudioBloc mapEventToState prepareAudio");
    } else if (event is PlayEvent) {
      if (isAssetsAudio(kUrl1)) {
        playAudioFromAssets();
      } else {
        playAudio();
      }

      debugPrint("AudioBloc mapEventToState playAudio");
    } else if (event is PauseEvent) {
      // pauseAudio();
      debugPrint("AudioBloc mapEventToState pauseAudio");
    }
  }

  Future initMediaPlayer() async {
    final bytes = await readBytes(Uri.parse(kUrl1));
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/audio.mp3');

    await file.writeAsBytes(bytes);
  }

  bool isLocalUrl(String url) {
    return url.startsWith('/') ||
        url.startsWith('file://') ||
        url.substring(1).startsWith(':\\');
  }

  bool isAssetsAudio(String url) {
    return url.startsWith("assets");
  }

  static bool _isAndroid() {
    // we need to be careful because the "isAndroid" check throws errors on web.
    if (kIsWeb) {
      return false;
    }
    return Platform.isAndroid;
  }

  void prepareAudio() {
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      _audioPlayerState = state;
    });
  }

  void dispose() {
    _audioPlayer.dispose();
    _audioPlayer.release();
  }

  playAudio() async {
    debugPrint("play - is local: ${isLocalUrl(kUrl1)}");
    await _audioPlayer.play(kUrl1, isLocal: isLocalUrl(kUrl1));
  }

  playAudioFromAssets() async {
    if (_isAndroid()) {
      ByteData bytes = await rootBundle.load(kUrl1); //load audio from assets
      Uint8List audiobytes =
          bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
      await _audioPlayer.playBytes(audiobytes);
    }
  }

  pauseAudio() async {
    await _audioPlayer.pause();
  }
}
