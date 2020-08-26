import 'package:cah_apk/data/dummy_card_data.dart';
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

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': WhiteCardsViewScreen(WHITE_CARDS), 'title': Text('White')},
      {'page': BlackCardsViewScreen(BLACK_CARDS), 'title': Text('Black')}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ],
      ),
    );
  }
}
