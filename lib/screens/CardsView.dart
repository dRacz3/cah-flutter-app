import 'package:cah_apk/models/cards.dart';
import 'package:cah_apk/widgets/WhiteCardDisplay.dart';
import 'package:flutter/material.dart';

class CardsViewScreen extends StatelessWidget {
  final List<WhiteCard> displayedCards;

  const CardsViewScreen(this.displayedCards);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cards view"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...displayedCards.map((e) => WhiteCardDisplay(card: e)).toList()
            ],
          ),
        ));
  }
}
