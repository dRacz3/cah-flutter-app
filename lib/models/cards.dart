import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameCard {
  final String id;
  final String text;
  final String deck;
  final String icon;

  GameCard({this.id, this.text, this.deck, this.icon});
}

class WhiteCard extends GameCard {
  WhiteCard({String id, String text, String deck, String icon})
      : super(id: id, text: text, deck: deck, icon: icon);
}

class BlackCard extends GameCard {
  int pick;

  String get displayedText {
    return this.text.replaceAll('_', '_______');
  }

  BlackCard({String id, String text, String deck, String icon, int pick})
      : super(id: id, text: text, deck: deck, icon: icon) {
    this.pick = pick;
  }
}

IconData getCardIcon(String icon) {
  if (icon.contains('c-golby')) {
    return Icons.add_call;
  } else {
    return Icons.credit_card;
  }
}
