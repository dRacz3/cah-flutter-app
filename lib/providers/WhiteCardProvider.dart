import 'package:cah_apk/models/cards.dart';
import 'package:flutter/cupertino.dart';

class WhiteCardListProvider with ChangeNotifier {
  List<WhiteCard> _whiteCardList = [];

  List<WhiteCard> get cards {
    return [..._whiteCardList];
  }

  void update(List<WhiteCard> newCards) {
    _whiteCardList = newCards;
    notifyListeners();
  }
}
