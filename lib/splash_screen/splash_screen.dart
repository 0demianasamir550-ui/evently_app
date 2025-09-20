import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/onboarding_screen/onboarding1.dart'; // استيراد الصفحة الأولى من Onboarding

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
          title: 'Splash Screen',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode:
          themeProvider.isDarkMode() ? ThemeMode.dark : ThemeMode.light,
          home: const SplashScreen(),
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // تأخير 5 ثواني ثم الانتقال إلى OnboardingScreen1
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode() ? Colors.black : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 3),

            // ====== اللوجو الرئيسي ======
            Image.asset(
              'assets/images/logo_splash_screen.png',
              width: 136,
              height: 141,
              color: const Color(0xFF5669FF),
              colorBlendMode: BlendMode.srcIn,
            ),

            const SizedBox(height: 20),

            // ====== نص Evently ======
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

            const Spacer(flex: 4),

            // ====== الصورة السفلية route_logo.png بلون #5669FF ======
            Image.asset(
              'assets/images/route_logo.png',
              width: 136.23,
              height: 57.52,
              color: const Color(0xFF5669FF),
              colorBlendMode: BlendMode.srcIn,
            ),

            const SizedBox(height: 5),

            // ====== نص Supervised by Mohamed Nabil ======
            Padding(
              padding: EdgeInsets.only(
                  right: screenWidth * 0.25, // تحريك الجملة للشمال شوية
                  bottom: screenHeight * 0.02),
              child: Align(
                alignment: Alignment.centerRight,
                child: const Text(
                  'Supervised by Mohamed Nabil',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 38 / 14,
                    letterSpacing: 0,
                    color: Color(0xFF5669FF),
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