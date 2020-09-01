import 'dart:convert';

import 'package:cah_apk/providers/WhiteCardProvider.dart';
import 'package:cah_apk/screens/game_room_screen.dart';
import 'package:http/http.dart' as http;
import 'package:cah_apk/models/cards.dart';
import 'package:provider/provider.dart';
import './black_cards_view_screen.dart';
import './white_cards_view_screen.dart';
import 'package:flutter/material.dart';

import 'black_cards_view_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  WhiteCardListProvider whiteCards;
  List<BlackCard> blackCards = [];

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': WhiteCardsViewScreen(), 'title': Text('White')},
      {'page': BlackCardsViewScreen(), 'title': Text('Black')},
      {'page': GameRoomScreen(), 'title': Text('Game Room')}
    ];

    whiteCards = WhiteCardListProvider();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => whiteCards,
      child: Scaffold(
        // drawer: MainDrawer(),
        appBar: AppBar(title: _pages[_selectedPageIndex]['title']),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('White'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Black'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.airplay),
              title: Text('Black'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            // http
            // .get("http://localhost:8000/api/whitecards/draw/5")
            // .then((resp) {
            http.get("http://10.0.2.2:8000/api/whitecards/draw/5").then((resp) {
              if (resp.statusCode == 200) {
                var data = jsonDecode(resp.body) as List<dynamic>;
                setState(() {
                  print("Parsing $data");
                  var cardList = data.map((e) {
                    print("Creating card with text ${e['text']}");
                    return WhiteCard(
                        id: e['id'],
                        deck: e['deck'],
                        icon: e['icon'],
                        text: e['text']);
                  }).toList();

                  whiteCards.update(cardList);
                });
              }
            });
          },
        ),
      ),
    );
  }
}
