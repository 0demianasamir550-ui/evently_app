import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/onboarding_screen/onboarding2.dart'; // استيراد الصفحة الثانية

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

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: themeProvider.isDarkMode() ? Colors.black : Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 50),

            // ====== اللوجو + كلمة Evently بجانب بعض ======
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_splash_screen.png',
                  width: 54,
                  height: 55,
                  color: const Color(0xFF5669FF),
                  colorBlendMode: BlendMode.srcIn,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Evently',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Jockey One',
                    fontWeight: FontWeight.w400,
                    fontSize: 36,
                    height: 1.0,
                    letterSpacing: -0.3,
                    color: Color(0xFF5669FF),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),
            // ====== الصورة ======
            Center(
              child: Image.asset(
                themeProvider.isDarkMode()
                    ? 'assets/images/image_one_dark.png'
                    : 'assets/images/image_one.png',
                width: 261,
                height: 361,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),
            // ====== العنوان تحت الصورة ======
            const Text(
              "Personalize Your Experience",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                height: 1.0,
                letterSpacing: 0,
                color: Color(0xFF5669FF),
              ),
            ),

            const SizedBox(height: 10),
            // ====== الجملة الجديدة تحت العنوان مع لون ديناميكي حسب Theme ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.5,
                  color: themeProvider.isDarkMode() ? Colors.white : Colors.black,
                ),
              ),
            ),

            const Spacer(),
            // ====== زر Let's Start أسفل الشاشة ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingScreen2(),
                    ),
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