import 'package:cah_apk/models/cards.dart';
import 'package:flutter/material.dart';

class WhiteCardDisplay extends StatelessWidget {
  final WhiteCard card;

  final Function onTap;

  const WhiteCardDisplay({this.card, this.onTap});

  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 15,
        margin: const EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(border: Border.all()),
          padding: const EdgeInsets.all(15),
          height: maxHeight * 0.25,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  Text(
                    card.text,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                ],
              ),
              Row(children: [
                Icon(getCardIcon(card.icon)),
                Text(card.deck),
              ]),
            ],
          ),
        ));
  }
}
