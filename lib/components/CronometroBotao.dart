import 'package:flutter/material.dart';

class CronometroBotaoTrabalho extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? click;

  const CronometroBotaoTrabalho({
    required this.texto,
    required this.icone,
    this.click,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        //backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black54,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        shadowColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 22,
        ),
        enableFeedback: true,
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(
              width: 5,
              color: Colors.white,
            )),
      ),
      onPressed: click,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icone,
              size: 30,
            ),
          ),
          Text(texto),
        ],
      ),
    );
  }
}

class CronometroBotaoDescanso extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? click;

  const CronometroBotaoDescanso({
    required this.texto,
    required this.icone,
    this.click,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        //backgroundColor: Colors.yellow,
        foregroundColor: Colors.white,
        backgroundColor: Colors.black54,
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        shadowColor: Colors.black38,
        textStyle: const TextStyle(
          fontSize: 22,
        ),
        enableFeedback: true,
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: const BorderSide(
              width: 5,
              color: Colors.greenAccent,
            )),
      ),
      onPressed: click,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              icone,
              size: 30,
            ),
          ),
          Text(texto),
        ],
      ),
    );
  }
}

class CronometroBotaoPlayMusic extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? click;

  const CronometroBotaoPlayMusic({
    required this.texto,
    required this.icone,
    this.click,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: click,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      foregroundColor: Colors.white,
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          color: Color.fromARGB(209, 41, 162, 45),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(136, 46, 81, 0),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: const Icon(
          //Icons.play_circle_filled_sharp,
          Icons.volume_up_rounded,
          size: 35,
        ),
      ),
    );
  }
}

class CronometroBotaoStopMusic extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? click;

  const CronometroBotaoStopMusic({
    required this.texto,
    required this.icone,
    this.click,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: click,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      foregroundColor: Colors.white,
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          color: Color.fromARGB(209, 154, 158, 154),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(136, 46, 81, 0),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: const Icon(
          //Icons.stop_circle_sharp,
          Icons.volume_off_rounded,
          size: 35,
        ),
      ),
    );
  }
}
