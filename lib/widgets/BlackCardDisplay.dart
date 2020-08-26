import 'package:cah_apk/models/cards.dart';
import 'package:flutter/material.dart';

class BlackCardDisplay extends StatelessWidget {
  final BlackCard card;

  final Function onTap;

  const BlackCardDisplay({this.card, this.onTap});

  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    return Card(
        color: Colors.black,
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
                    card.displayedText,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  )
                ],
              ),
              Row(children: [
                Icon(
                  getCardIcon(card.icon),
                  color: Colors.white,
                ),
                Text(
                  card.deck,
                  style: TextStyle(color: Colors.white),
                ),
              ]),
            ],
          ),
        ));
  }
}
