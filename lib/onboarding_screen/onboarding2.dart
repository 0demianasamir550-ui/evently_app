
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'onboarding_header.dart';
import 'onboarding3.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: MediaQuery.of(context).size.height,
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
                'assets/images/image_two.png',
                fit: BoxFit.cover,
              ),
            ),

            // Pagination Dots (النقطة الأولى ملونة)
            Positioned(
              bottom: 90,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  bool isActive = index == 0;
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: isActive ? const Color(0xFF5669FF) : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ),

            // سهم يمين → الانتقال للصفحة الثالثة
            Positioned(
              bottom: 20,
              right: 16,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OnboardingScreen3()),
                  );
                },
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF5669FF), width: 2),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF5669FF),
                      size: 28,
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