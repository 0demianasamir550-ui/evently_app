import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/providers/app_theme.dart';

// ---------------- MAIN ----------------
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.isDarkMode() ? ThemeMode.dark : ThemeMode.light,
      home: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: RectangleTitleDescriptionWidget(),
          ),
        ),
      ),
    );
  }
}

// ---------------- WIDGET ----------------
class RectangleTitleDescriptionWidget extends StatefulWidget {
  const RectangleTitleDescriptionWidget({super.key});

  @override
  State<RectangleTitleDescriptionWidget> createState() =>
      _RectangleTitleDescriptionWidgetState();
}

class _RectangleTitleDescriptionWidgetState
    extends State<RectangleTitleDescriptionWidget> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // ألوان حسب الثيم
    final borderColor = isDark ? const Color(0xFF5669FF) : const Color(0xFF7B7B7B);
    final labelColor = isDark ? Colors.white : Colors.black;
    final placeholderColor = isDark ? Colors.white : const Color(0xFF7B7B7B);
    final iconColor = isDark ? Colors.white : const Color(0xFF7B7B7B);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // -------- Title Label --------
        Text(
          "Title",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.0,
            letterSpacing: 0,
            color: labelColor,
          ),
        ),
        const SizedBox(height: 8),

        // -------- Title Rectangle --------
        Container(
          width: double.infinity,
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 1),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/icon_title.png',
                width: 24,
                height: 24,
                color: iconColor,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: titleController,
                  style: TextStyle(color: labelColor, fontSize: 16),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Event Title",
                    hintStyle: TextStyle(color: placeholderColor, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // -------- Description Label --------
        Text(
          "Description",
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.0,
            letterSpacing: 0,
            color: labelColor,
          ),
        ),
        const SizedBox(height: 8),

        // -------- Description Rectangle --------
        Container(
          width: double.infinity,
          height: 127,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: 1),
          ),
          child: TextField(
            controller: descriptionController,
            maxLines: null,
            expands: true,
            style: TextStyle(color: labelColor, fontSize: 16),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Event Description",
              hintStyle: TextStyle(color: placeholderColor, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}