import 'package:flutter/material.dart';

// ------------------ CustomBox Widget ------------------
class CustomBox extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final Widget? child; // ← اضفنا child

  const CustomBox({
    super.key,
    this.width = 361,
    this.height = 56,
    this.borderRadius = 16,
    this.borderWidth = 1,
    this.child, // ← تمرير child
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // تحديد لون الحدود حسب الثيم
    final borderColor = theme.brightness == Brightness.dark
        ? const Color(0xFF5669FF)
        : const Color(0xFF7B7B7B);

    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: theme.cardColor, // الخلفية حسب الثيم
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: child, // ← عرض الـ child هنا
    );
  }
}