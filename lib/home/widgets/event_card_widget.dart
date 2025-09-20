import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/providers/app_theme.dart';

class CustomRectangleWidget extends StatelessWidget {
  const CustomRectangleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final isDark = themeProvider.isDarkMode();

    return Scaffold(
      backgroundColor: isDark ? Colors.black87 : Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 16), // نزله شويه
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 361,
            height: 203.06,
            decoration: BoxDecoration(
              color: isDark ? Colors.black : Colors.white, // حسب الـ theme
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF5669FF),
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppThemeProvider(),
      child: const MaterialApp(
        home: CustomRectangleWidget(),
      ),
    ),
  );
}