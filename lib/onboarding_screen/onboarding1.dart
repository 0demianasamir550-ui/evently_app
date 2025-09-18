import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'onboarding_header.dart';
import 'onboarding2.dart';

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
    return Consumer<AppThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Onboarding Page 1',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.isDarkMode() ? ThemeMode.dark : ThemeMode.light,
          home: const OnboardingScreen1(),
        );
      },
    );
  }
}

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: themeProvider.isDarkMode() ? Colors.black : Colors.white,
        child: Stack(
          children: [
            const OnboardingHeader(),

            // الصورة
            Positioned(
              top: 200,
              left: (screenWidth - 261) / 2,
              width: 261,
              height: 361,
              child: Image.asset(
                'assets/images/image_one.png',
                fit: BoxFit.cover,
              ),
            ),

            // زر أسفل الشاشة → الانتقال للصفحة الثانية
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnboardingScreen2()),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5669FF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      "Let's Start",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}