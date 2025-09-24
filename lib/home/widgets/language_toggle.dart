import 'package:flutter/material.dart';

class LanguageToggle extends StatelessWidget {
  final String selectedLanguage;
  final ValueChanged<String> onChanged;

  const LanguageToggle({
    super.key,
    required this.selectedLanguage,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLanguageOption("en", "🇺🇸"),
        const SizedBox(width: 10),
        _buildLanguageOption("ar", "🇪🇬"),
      ],
    );
  }

  Widget _buildLanguageOption(String lang, String flag) {
    bool isSelected = selectedLanguage == lang;
    return GestureDetector(
      onTap: () => onChanged(lang),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          flag,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}