import 'package:flutter/material.dart';
import 'package:film/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: Colors.white,
        // ignore: prefer_const_constructors
        textTheme: TextTheme(
          bodyText2: const TextStyle(color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}
