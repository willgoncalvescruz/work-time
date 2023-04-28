import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:audio_helper/audio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:worktime/components/CronometroBotao.dart';
import 'package:provider/provider.dart';
import '../store/worktime.store.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<WorkTimeStore>(context);

    return Observer(
      builder: (_) {
        return Container(
          color: store.estaTrabalhando() ? Colors.blue : Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //AudioHelper.playSound('descanso.mp3'),
              const SizedBox(height: 20),
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
              const SizedBox(height: 10),
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
                            padding: const EdgeInsets.only(right: 10),
                            child: CronometroBotaoTrabalho(
                              texto: 'Iniciar',
                              icone: Icons.play_arrow,
                              click: store.iniciar,
                            ),
                          ),
                        if (store.iniciado)
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CronometroBotaoTrabalho(
                              texto: 'Parar',
                              icone: Icons.stop,
                              click: store.parar,
                            ),
                          ),
                        if (store.iniciado)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
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
                            padding: const EdgeInsets.only(right: 10),
                            child: CronometroBotaoDescanso(
                              texto: 'Iniciar',
                              icone: Icons.play_arrow,
                              click: store.iniciar,
                            ),
                          ),
                        if (store.iniciado)
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CronometroBotaoDescanso(
                              texto: 'Parar',
                              icone: Icons.stop,
                              click: store.parar,
                            ),
                          ),
                        if (store.iniciado)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
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
        );
      },
    );
  }
}


//   final musica = await AudioHelper.initial(backgroundMusicNames: ['descanso.mp3'],);
//  //Play
//  AudioHelper.playMusic();
//  //Stop
//  AudioHelper.stopMusic();
//  //Reproduzir Sim
//  AudioHelper.playSound('descanso.mp3');


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
