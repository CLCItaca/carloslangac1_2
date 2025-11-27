import 'package:audioplayers/audioplayers.dart';


class Music {
  static final AudioPlayer audioPlayer = AudioPlayer();

  static Future<void> playMusic() async {
    try{
      print("Entra");
      await audioPlayer.play(AssetSource('music/Shop Music.mp3'));
    }
    catch (e) {
      print('Error al reproducir: $e');
    }
  }

  static Future<void> stopMusic() async {
    await audioPlayer.stop();
  }

}