import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_sizes.dart';
import '../../../../shared/utils/build_context_ext.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.title,
    required this.imageUri,
    this.width,
    this.height,
    this.onTap,
  });

  final String title;
  final String imageUri;

  /// If not provided, default width is 240.
  final double? width;

  /// If not provided, default height is 164.
  final double? height;

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width ?? AppWidths.w240,
        height: height ?? AppHeights.h164,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.p12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: imageUri,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              _TitleText(title),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppWidths.w14,
          vertical: AppHeights.h10,
        ),
        child: SizedBox(
          width: AppWidths.w212,
          height: AppHeights.h40,
          child: Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
