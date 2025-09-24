import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/onboarding_screen/onboarding2.dart'; // استيراد الصفحة الثانية

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppThemeProvider()),
        ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final langProvider = Provider.of<AppLanguageProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Page 1',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeProvider.isDarkMode() ? ThemeMode.dark : ThemeMode.light,
      locale: Locale(langProvider.appLanguage), // ربط اللغة بالـ provider
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const OnboardingScreen1(),
    );
  }
}

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var langProvider = Provider.of<AppLanguageProvider>(context);
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: themeProvider.isDarkMode() ? Colors.black : Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 50),

            // اللوجو + كلمة Evently
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
                Text(
                  loc.evently,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
            // الصورة
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
            // العنوان تحت الصورة
            Text(
              loc.personalize_experience,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                height: 1.0,
                letterSpacing: 0,
                color: Color(0xFF5669FF),
              ),
            ),

            const SizedBox(height: 10),
            // الجملة الجديدة تحت العنوان
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                loc.choose_preferred_theme,
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
            // زر Let's Start
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
                  child: Center(
                    child: Text(
                      loc.lets_start,
                      style: const TextStyle(
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