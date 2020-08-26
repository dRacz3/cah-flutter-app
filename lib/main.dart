import 'package:cah_apk/data/dummy_card_data.dart';
import 'package:cah_apk/screens/CardsView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cards Agains Humanity RD Edition',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (ctx) => CardsViewScreen(WHITE_CARDS),
      },
    );
  }
}
