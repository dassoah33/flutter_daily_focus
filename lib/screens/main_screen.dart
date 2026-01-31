import 'package:flutter/material.dart';
import '../models/focus_message.dart';
import 'home_screen.dart';
import 'favorites_screen.dart';

/// Écran principal - gère la navigation entre les onglets
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<FocusMessage> _favorites = [];

  void _toggleFavorite(FocusMessage message) {
    setState(() {
      if (_favorites.contains(message)) {
        _favorites.remove(message);
      } else {
        _favorites.add(message);
      }
    });
  }

  bool _isFavorite(FocusMessage message) {
    return _favorites.contains(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Focus'),
        backgroundColor: const Color(0xFF16213E),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(
            onToggleFavorite: _toggleFavorite,
            isFavorite: _isFavorite,
          ),
          FavoritesScreen(
            favorites: _favorites,
            onToggleFavorite: _toggleFavorite,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: const Color(0xFF0F0F1A),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: 'Phrases',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoris',
          ),
        ],
      ),
    );
  }
}