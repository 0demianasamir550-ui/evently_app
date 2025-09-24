import 'package:flutter/material.dart';

class ThemeToggle extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onChanged;

  const ThemeToggle({
    super.key,
    required this.isDark,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildThemeOption(false, Icons.wb_sunny),
        const SizedBox(width: 10),
        _buildThemeOption(true, Icons.nightlight_round),
      ],
    );
  }

  Widget _buildThemeOption(bool dark, IconData icon) {
    bool isSelected = isDark == dark;
    return GestureDetector(
      onTap: () => onChanged(dark),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}