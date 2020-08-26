import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhiteCard {
  final String id;
  final String text;
  final String deck;
  final String icon;

  WhiteCard({this.id, this.text, this.deck, this.icon});
}

class BlackCard {
  final String id;
  final String text;
  final String deck;
  final int pick;

  BlackCard({this.id, this.text, this.deck, this.pick});
}

IconData getCardIcon(String icon) {
  if (icon.contains('c-golby')) {
    return Icons.add_call;
  } else {
    return Icons.credit_card;
  }
}
