import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:worktime/components/CronometroBotao.dart';
import 'package:provider/provider.dart';
import '../store/worktime.store.dart';
//import 'package:audioplayers/audio_cache.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  get audioPlayer => AudioPlayer();

  get localPath => audioPlayer;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<WorkTimeStore>(context);

    //String audioasset = "assets/audio/descanso.mp3";
//ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
//Uint8List audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    return Observer(
      builder: (_) {
        return Stack(
          children: <Widget>[
            Container(
              decoration: store.estaTrabalhando()
                  ? const BoxDecoration(
                      gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(255, 108, 163, 250),
                        Color.fromARGB(255, 1, 108, 249),
                        Color.fromARGB(255, 108, 163, 250),
                      ],
                    ))
                  : const BoxDecoration(
                      gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromARGB(255, 0, 136, 66),
                        Color.fromRGBO(20, 222, 58, 50),
                        Color.fromARGB(255, 0, 136, 66),
                      ],
                    )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 250,
                    height: 230,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: store.estaTrabalhando()
                              ? const AssetImage("assets/images/trabalho.png")
                              : const AssetImage("assets/images/descanso.png")),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    store.estaTrabalhando()
                        ? 'Hora de Trabalhar'
                        : 'Hora de Descansar',
                    style: const TextStyle(
                      fontSize: 37,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
                    style: const TextStyle(
                      fontSize: 120,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  store.estaTrabalhando()
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!store.iniciado)
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, bottom: 15),
                                child: CronometroBotaoTrabalho(
                                  texto: 'Iniciar',
                                  icone: Icons.play_arrow,
                                  click: store.iniciar,
                                ),
                              ),
                            if (store.iniciado)
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, bottom: 15),
                                child: CronometroBotaoTrabalho(
                                  texto: 'Parar',
                                  icone: Icons.stop,
                                  click: store.parar,
                                ),
                              ),
                            if (store.iniciado)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 15),
                                child: CronometroBotaoTrabalho(
                                  texto: 'Reiniciar',
                                  icone: Icons.refresh,
                                  click: store.reiniciar,
                                ),
                              ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!store.iniciado)
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, bottom: 15),
                                child: CronometroBotaoDescanso(
                                  texto: 'Iniciar',
                                  icone: Icons.play_arrow,
                                  click: store.iniciar,
                                ),
                              ),
                            if (store.iniciado)
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, bottom: 15),
                                child: CronometroBotaoDescanso(
                                  texto: 'Parar',
                                  icone: Icons.stop,
                                  click: store.parar,
                                ),
                              ),
                            if (store.iniciado)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 15),
                                child: CronometroBotaoDescanso(
                                  texto: 'Reiniciar',
                                  icone: Icons.refresh,
                                  click: store.reiniciar,
                                ),
                              ),
                          ],
                        ),
                ],
              ),
            ),
            Container(
                child: store.musicainiciada
                    ? Positioned(
                        left: 50.0,
                        top: 150.0,
                        child: Visibility(
                          visible: store.estaTrabalhando() ? false : true,
                          child: CronometroBotaoPlayMusic(
                            texto: '',
                            icone: Icons.stop_circle,
                            click: store.pararmusica,
                          ),
                        ),
                      )
                    : Positioned(
                        left: 50.0,
                        top: 150.0,
                        child: Visibility(
                          visible: store.estaTrabalhando() ? false : true,
                          child: CronometroBotaoStopMusic(
                            texto: '',
                            icone: Icons.play_circle,
                            click: store.iniciarmusica,
                          ),
                        ),
                      ))
          ],
        );
      },
    );
  }
}

AudioPlayer playMusicDescanso() {
  final playerPlay = AudioPlayer();
  playerPlay.play(AssetSource('audio/descanso.mp3'));
  return playerPlay;
}

AudioPlayer stopMusicDescanso() {
  final playerStop = AudioPlayer();
  playerStop.stop();
  return playerStop;
}


              // SizedBox(
              //   width: 350,
              //   height: 200,
              //   child: AnimatedSplashScreen(
              //     //duration: 4000,
              //     splash: store.estaTrabalhando()
              //         ? "assets/images/trabalho.png"
              //         : "assets/images/descanso.png",
              //     //'assets/images/trabalho.png',
              //     nextScreen: const Cronometro(),
              //     splashTransition: SplashTransition.rotationTransition,
              //     //pageTransitionType: PageTransitionType.rightToLeftJoined,
              //     //backgroundColor: Color.fromARGB(200, 115, 170, 90),
              //     backgroundColor: Colors.transparent,
              //   ),
              // ),
