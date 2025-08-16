import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/gen/assets.gen.dart';
import 'package:plant_app/shared/theme/app_colors.dart';
import 'package:plant_app/shared/theme/app_sizes.dart';
import 'package:plant_app/shared/utils/build_context_ext.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.hintText,
    this.hintStyle,
    required this.onSearchChanged,
  });

  final String? hintText;
  final TextStyle? hintStyle;
  final void Function(String) onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: context.textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            hintStyle ??
            context.textTheme.bodyLarge?.copyWith(color: AppColors.secondary),
        contentPadding: EdgeInsets.symmetric(horizontal: AppWidths.w16),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: AppWidths.w16, right: AppWidths.w10),
          child: SvgPicture.asset(
            Assets.icons.home.searchIcon,
            colorFilter: ColorFilter.mode(
              AppColors.secondary2,
              BlendMode.srcIn,
            ),
            width: AppWidths.w20,
            height: AppHeights.h20,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).cardTheme.color?.withValues(alpha: 0.92),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppSizes.p12),
        ),
      ),
      onChanged: onSearchChanged,
    );
  }
}
