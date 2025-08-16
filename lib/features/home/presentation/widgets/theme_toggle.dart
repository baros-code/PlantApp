import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../shared/theme/app_sizes.dart';
import '../../../../shared/theme/theme_provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Provider.of<ThemeProvider>(
      context,
      listen: true,
    ).isDarkMode;
    return SizedBox(
      child: ToggleButtons(
        selectedColor: Theme.of(context).primaryColor,
        fillColor: Theme.of(context).primaryColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(AppSizes.p12),
        isSelected: [!isDarkMode, isDarkMode],
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: Row(children: [Icon(Icons.light_mode)]),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Row(children: [Icon(Icons.dark_mode)]),
          ),
        ],
        onPressed: (index) {
          if (index == 0) {
            Provider.of<ThemeProvider>(
              context,
              listen: false,
            ).setThemeMode(ThemeMode.light);
          } else {
            Provider.of<ThemeProvider>(
              context,
              listen: false,
            ).setThemeMode(ThemeMode.dark);
          }
        },
      ),
    );
  }
}
