import 'package:flutter/material.dart';
import '../models/focus_message.dart';
import '../data/focus_data.dart';

/// Écran d'accueil - affiche les phrases avec bouton favori
class HomeScreen extends StatefulWidget {
  final Function(FocusMessage) onToggleFavorite;
  final bool Function(FocusMessage) isFavorite;

  const HomeScreen({
    super.key,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _nextMessage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % focusMessages.length;
    });
  }

  void _previousMessage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + focusMessages.length) % focusMessages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final message = focusMessages[_currentIndex];
    final isFav = widget.isFavorite(message);

    return Container(
      color: const Color(0xFF1A1A2E),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  message.title,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  message.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
                if (message.author != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    "— ${message.author}",
                    style: const TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.white54,
                    ),
                  ),
                ],
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _previousMessage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF1A1A2E),
                        padding: const EdgeInsets.all(16),
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 20),
                    ),
                    const SizedBox(width: 32),
                    ElevatedButton(
                      onPressed: _nextMessage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF1A1A2E),
                        padding: const EdgeInsets.all(16),
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(Icons.arrow_forward_ios, size: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              onPressed: () => widget.onToggleFavorite(message),
              icon: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : Colors.white54,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }
}