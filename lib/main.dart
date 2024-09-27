import 'package:app_viagens/Screens/about.dart';
import 'package:app_viagens/Screens/contact.dart';
import 'package:app_viagens/Screens/travel_packs.dart';
import 'package:app_viagens/Screens/travels.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      home: TabNavigator(),
    );
  }
}

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    Travels(),
    TravelPacks(),
    Contact(),
    About(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,  // Adicionado para garantir que os rótulos sejam exibidos
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Destinos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),  // Corrigido o ícone para "card_travel"
            label: 'Pacotes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_in_talk),  // Verifique se este ícone está disponível
            label: 'Contate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Sobre',
          ),
        ],
      ),
    );
  }
}
