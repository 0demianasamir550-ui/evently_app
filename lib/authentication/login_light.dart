import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/providers/app_theme.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';

// ------------------ CustomBox Widget ------------------
class CustomBox extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final Widget? child;

  const CustomBox({
    super.key,
    this.width = 361,
    this.height = 56,
    this.borderRadius = 16,
    this.borderWidth = 1,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = theme.brightness == Brightness.dark
        ? const Color(0xFF5669FF)
        : const Color(0xFF7B7B7B);

    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: child,
    );
  }
}

// ------------------ LoginPage ------------------
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  void handleLogin(AppLocalizations loc) {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.fill_all_fields)),
      );
      return;
    }

    if (!email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loc.invalid_email)),
      );
      return;
    }

    print('Login with: $email / $password');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppThemeProvider, AppLanguageProvider>(
      builder: (context, themeProvider, languageProvider, child) {
        final isDark = themeProvider.isDarkMode();
        final loc = AppLocalizations.of(context)!;
        final backgroundColor = isDark ? const Color(0xFF101127) : Colors.white;
        final logoColor = const Color(0xFF5669FF);

        return Scaffold(
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Container(color: backgroundColor),
                ),
                const SizedBox(height: 8),
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
                Text(
                  loc.evently,
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
                const SizedBox(height: 20),
                // Email
                CustomBox(
                  child: Row(
                    children: [
                      Icon(Icons.email, color: isDark ? Colors.white : Color(0xFF7B7B7B)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: isDark ? Colors.white : Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: loc.email,
                            hintStyle: TextStyle(color: isDark ? Colors.white : Color(0xFF7B7B7B)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Password
                CustomBox(
                  child: Row(
                    children: [
                      Icon(Icons.lock, color: isDark ? Colors.white : Color(0xFF7B7B7B)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: passwordController,
                          obscureText: _obscurePassword,
                          style: TextStyle(color: isDark ? Colors.white : Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: loc.password,
                            hintStyle: TextStyle(color: isDark ? Colors.white : Color(0xFF7B7B7B)),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        child: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: isDark ? Colors.white : Color(0xFF7B7B7B),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Forget Password
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      loc.forget_password,
                      style: const TextStyle(color: Color(0xFF5669FF), decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Login Button
                SizedBox(
                  width: 361,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => handleLogin(loc),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5669FF),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: Text(
                      loc.login,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Don't Have Account & Create Account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      loc.dont_have_account,
                      style: TextStyle(color: isDark ? Colors.white : Color(0xFF7B7B7B)),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        print('Navigate to Register');
                      },
                      child: Text(
                        loc.create_account,
                        style: const TextStyle(color: Color(0xFF5669FF), decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // OR Line
                Row(
                  children: [
                    const Expanded(child: Divider(thickness: 1, color: Color(0xFF5669FF))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(loc.or, style: const TextStyle(color: Color(0xFF5669FF))),
                    ),
                    const Expanded(child: Divider(thickness: 1, color: Color(0xFF5669FF))),
                  ],
                ),
                const SizedBox(height: 16),
                // Login With Google
                CustomBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/google_icon.png",
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Login With Google",
                        style: const TextStyle(color: Color(0xFF5669FF), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
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
      theme: ThemeData.light().copyWith(cardColor: Colors.white),
      darkTheme: ThemeData.dark().copyWith(cardColor: const Color(0xFF1E1E1E)),
      themeMode: themeProvider.isDarkMode() ? ThemeMode.dark : ThemeMode.light,
      locale: Locale(languageProvider.appLanguage),
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const LoginPage(),
    );
  }
}