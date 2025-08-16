import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme/app_colors.dart';
import '../../../../shared/theme/app_sizes.dart';
import '../../../../shared/utils/build_context_ext.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
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
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.p12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardTheme.color,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: AppWidths.w0_5,
                    color: AppColors.borderColor.withValues(alpha: 0.1),
                  ),
                ),
              ),
              CachedNetworkImage(
                imageUrl: imageUri,
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Card(
                  child: Center(
                    child: Icon(
                      Icons.refresh,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
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
    return SizedBox(
      height: AppHeights.h42,
      child: Padding(
        padding: EdgeInsets.fromLTRB(AppWidths.w16, AppHeights.h16, 0, 0),
        child: Text(
          title,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
