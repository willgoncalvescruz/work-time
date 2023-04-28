import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:audio_helper/audio_helper.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:provider/provider.dart';
import 'package:worktime/pages/work_time.dart';
import 'store/worktime.store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget home = SplashScreenView(
      navigateRoute: const WorkTime(),
      duration: 4000,
      imageSize: 150,
      imageSrc: "assets/images/logo.png",
      text: "Work Time",
//textType: TextType.ColorizeAnimationText,
      textType: TextType.ScaleAnimatedText,
      textStyle: const TextStyle(
        fontSize: 50.0,
      ),

      colors: const [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: const Color.fromARGB(255, 45, 149, 201),
    );

    return MultiProvider(
      providers: [
        Provider<WorkTimeStore>(
          create: (_) => WorkTimeStore(),
        ),
      ],
      child: MaterialApp(
        title: 'Work Time',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //home: const WorkTime(),
        home: home,
      ),
    );
  }
}

// class Home extends StatefulWidget {
//   const Home({super.key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }


        // AnimatedSplashScreen(
        //   duration: 4000,
        //   splash: "assets/images/logo.png",
        //   //'assets/images/trabalho.png',
        //   nextScreen: const WorkTime(),
        //   splashTransition: SplashTransition.fadeTransition,
        //   //pageTransitionType: PageTransitionType.rightToLeftJoined,
        //   //backgroundColor: Color.fromARGB(200, 115, 170, 90),
        //   backgroundColor: const Color.fromARGB(255, 45, 149, 201),
        // );

//         AnimatedSplashScreen(
//       duration: 4000,
//       splash: 'assets/images/logo.png',
//       nextScreen: const WorkTime(),
//       splashTransition: SplashTransition.rotationTransition,
// //pageTransitionType: PageTransitionType.rightToLeftJoined,
//       backgroundColor: const Color.fromARGB(255, 45, 149, 201),
//     );