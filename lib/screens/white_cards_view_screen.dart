import 'package:cah_apk/models/cards.dart';
import 'package:cah_apk/widgets/WhiteCardDisplay.dart';
import 'package:flutter/material.dart';

class WhiteCardsViewScreen extends StatelessWidget {
  final List<WhiteCard> displayedCards;

  const WhiteCardsViewScreen(this.displayedCards);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          ...displayedCards.map((e) => WhiteCardDisplay(card: e)).toList()
        ],
      ),
    ));
  }
}
