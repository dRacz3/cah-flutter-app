import 'package:cah_apk/models/cards.dart';
import 'package:flutter/material.dart';

class WhiteCardDisplay extends StatefulWidget {
  final WhiteCard card;

  final Function onTap;

  const WhiteCardDisplay({this.card, this.onTap});

  @override
  _WhiteCardDisplayState createState() => _WhiteCardDisplayState();
}

class _WhiteCardDisplayState extends State<WhiteCardDisplay> {
  var expandCard = false;

  Widget _buildCardView(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    double height_pct = 0.35;
    if (!expandCard) {
      height_pct = 0.15;
    }

    return InkWell(
      onLongPress: () {
        setState(() {
          expandCard = !expandCard;
        });
      },
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        padding: const EdgeInsets.all(15),
        height: maxHeight * height_pct,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Stack(
              children: [
                Text(
                  widget.card.text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
            _buildDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails() {
    if (expandCard) {
      return Row(children: [
        Icon(getCardIcon(widget.card.icon)),
        Text(widget.card.deck),
      ]);
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 15,
        margin: const EdgeInsets.all(15),
        child: _buildCardView(context));
  }
}
