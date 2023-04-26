import 'package:flutter/material.dart';
import 'package:worktime/pages/Pomodoro.dart';
import 'package:provider/provider.dart';
import 'store/worktime.store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
        home: const WorkTime(),
      ),
    );
  }
}
