import 'package:evently_app/home/tabs/profile/profile_tab.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ProfileTab(), // استخدم const لو ProfileTab ثابتة
    );
  }
}