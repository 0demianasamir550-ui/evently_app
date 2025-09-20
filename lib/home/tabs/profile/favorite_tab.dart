import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/providers/app_language_provider.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<AppThemeProvider>(context);
    final isDark = theme.isDarkMode();

    return Scaffold(
      backgroundColor: isDark ? Colors.black87 : Colors.white,
      body: const Center(
        child: Text(
          "Favorite Page",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}