import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:worktime/components/Cronometro.dart';
import 'package:worktime/components/EntradaTempo.dart';
import 'package:provider/provider.dart';
import '../store/worktime.store.dart';

class WorkTime extends StatelessWidget {
  const WorkTime({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<WorkTimeStore>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Cronometro(),
          ),
          const SizedBox(
            height: 10,
            child: DecoratedBox(
                decoration:
                    BoxDecoration(color: Color.fromARGB(212, 90, 90, 90))),
            // child: Container()
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 50),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EntradaTempo(
                    titulo: 'Trabalho',
                    valor: store.tempoTrabalho,
                    inc: store.iniciado && store.estaTrabalhando()
                        ? null
                        : store.incrementarTempoTrabalho,
                    dec: store.iniciado && store.estaTrabalhando()
                        ? null
                        : store.decrementarTempoTrabalho,
                  ),
                  EntradaTempo(
                    titulo: 'Descanso',
                    valor: store.tempoDescanso,
                    inc: store.iniciado && store.estaDescansando()
                        ? null
                        : store.incrementarTempoDescanso,
                    dec: store.iniciado && store.estaDescansando()
                        ? null
                        : store.decrementarTempoDescanso,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
