import 'dart:async';
import 'package:audio_helper/audio_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
part 'worktime.store.g.dart';
//part 'worktime/store/worktime.store.g.dart';

class WorkTimeStore = _WorkTimeStore with _$WorkTimeStore;

enum TipoIntervalo { trabalho, descanso }

abstract class _WorkTimeStore with Store {
  @observable
  bool iniciado = false;

  @observable
  int minutos = 10;

  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 10;

  @observable
  int tempoDescanso = 10;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.trabalho;

  Timer? cronometro;

  @action
  void iniciar() {
    //play();
    iniciado = true;
    cronometro = Timer.periodic(const Duration(seconds: 1), (timer) {
      //cronometro = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      //test
      if (minutos == 0 && segundos == 0) {
        _trocarTipoIntervalo();
      } else if (segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }
    });
  }

  @action
  void parar() {
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void reiniciar() {
    parar();
    minutos = estaTrabalhando() ? tempoTrabalho : tempoDescanso;
    segundos = 0;
    //iniciar();
  }

  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho++;
    if (estaTrabalhando()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoTrabalho() {
    if (tempoTrabalho > 1) {
      tempoTrabalho--;
      if (estaTrabalhando()) {
        reiniciar();
      }
    }
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
    if (estaDescansando()) {
      reiniciar();
    }
  }

  @action
  void decrementarTempoDescanso() {
    if (tempoDescanso > 1) {
      tempoDescanso--;
      if (estaDescansando()) {
        reiniciar();
      }
    }
  }

  bool estaTrabalhando() {
    return tipoIntervalo == TipoIntervalo.trabalho;
  }

  bool estaDescansando() {
    return tipoIntervalo == TipoIntervalo.descanso;
  }

  void _trocarTipoIntervalo() {
    if (estaTrabalhando()) {
      tipoIntervalo = TipoIntervalo.descanso;
      minutos = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.trabalho;
      minutos = tempoTrabalho;
    }
    segundos = 0;
  }

  // Future<void> play() async {
  //   await AudioHelper.initial(
  //     backgroundMusicNames: ['descanso.mp3'],
  //   );
  //   // AudioHelper.initial(
  //   //   backgroundMusicNames: ['descanso.mp3'],
  //   // );
  //   //AudioHelper.playSound('descanso.mp3');
  // }
}
