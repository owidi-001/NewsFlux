import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsflux/ui/home.screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          // fontFamily: "monospace",
          textTheme: const TextTheme(
            headline4: TextStyle(color: Colors.black),
            headline5: TextStyle(
                color: Colors.black87,
                fontSize: 24,
                fontWeight: FontWeight.w500),
            bodyText1: TextStyle(
              color: Colors.black45,
            ),
          )),
      // darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
