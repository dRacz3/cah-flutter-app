import 'package:cah_apk/models/cards.dart';
import 'package:cah_apk/widgets/BlackCardDisplay.dart';
import 'package:flutter/material.dart';

class BlackCardsViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          // ...displayedCards.map((e) => BlackCardDisplay(card: e)).toList()
        ],
      ),
    ));
  }
}
