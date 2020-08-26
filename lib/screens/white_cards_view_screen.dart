import 'package:cah_apk/models/cards.dart';
import 'package:cah_apk/providers/WhiteCardProvider.dart';
import 'package:cah_apk/widgets/WhiteCardDisplay.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WhiteCardsViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<WhiteCard> displayedCards =
        Provider.of<WhiteCardListProvider>(context).cards;
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
