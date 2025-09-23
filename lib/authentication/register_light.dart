import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'login_light.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppThemeProvider, AppLanguageProvider>(
      builder: (context, themeProvider, languageProvider, child) {
        final isDark = themeProvider.isDarkMode();
        final loc = AppLocalizations.of(context)!; // كل النصوص مترجمة حسب اللغة

        final backgroundColor = isDark ? const Color(0xFF101127) : Colors.white;
        final appBarColor = backgroundColor;
        final logoColor = const Color(0xFF5669FF);

        return Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            children: [
              // AppBar وهمي
              SizedBox(
                width: double.infinity,
                height: 48,
                child: Container(color: appBarColor),
              ),
              const SizedBox(height: 8),
              // Header السهم + Register
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginPage()),
                        );
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        size: 28,
                        color: Color(0xFF5669FF),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          loc.register, // <-- نص مترجم حسب اللغة
                          style: const TextStyle(
                            fontFamily: "Jockey One",
                            fontWeight: FontWeight.w400,
                            fontSize: 24,
                            color: Color(0xFF5669FF),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 28),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // المربع مع الصورة
              Center(
                child: SizedBox(
                  width: 152,
                  height: 157,
                  child: Image.asset(
                    "assets/images/logo_splash_screen.png",
                    color: logoColor,
                    colorBlendMode: BlendMode.srcIn,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              // نص اسم التطبيق مترجم
              Text(
                loc.evently, // <-- نص مترجم حسب اللغة
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "Jockey One",
                  fontWeight: FontWeight.w400,
                  fontSize: 36,
                  height: 1.0,
                  letterSpacing: -0.3,
                  color: Color(0xFF5669FF),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        );
      },
    );
  }
}

// ==================== main ====================
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
    final languageProvider = Provider.of<AppLanguageProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkMode() ? ThemeData.dark() : ThemeData.light(),
      locale: Locale(languageProvider.appLanguage),
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const RegisterPage(),
    );
  }
}