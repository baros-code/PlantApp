import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_sizes.dart';

class BasePage extends StatelessWidget {
  const BasePage({
    super.key,
    this.title,
    this.body,
    this.floatingActionButton,
    this.backgroundColor,
    this.appBarBackgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.centerTitle = false,
    this.safeAreaEnabled = true,
    this.appBarbottom,
    this.bodyPadding,
  });

  final Widget? title;
  final Widget? body;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final Color? appBarBackgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool centerTitle;
  final bool safeAreaEnabled;
  final PreferredSizeWidget? appBarbottom;
  final EdgeInsets? bodyPadding;

  @override
  Widget build(BuildContext context) {
    final overlay = _getOverlayStyle(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlay,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: title != null ? _buildAppBar(overlay) : null,
        body: _buildBody(),
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButton: floatingActionButton,
      ),
    );
  }

  // Helpers
  PreferredSizeWidget _buildAppBar(SystemUiOverlayStyle overlay) {
    return AppBar(
      backgroundColor: appBarBackgroundColor,
      automaticallyImplyLeading: false,
      title: title,
      centerTitle: centerTitle,
      systemOverlayStyle: overlay,
      toolbarHeight: AppHeights.h56,
      bottom: appBarbottom,
    );
  }

  Widget? _buildBody() {
    return body != null
        ? SafeArea(
            left: safeAreaEnabled,
            top: safeAreaEnabled,
            right: safeAreaEnabled,
            bottom: safeAreaEnabled,
            child: body!,
          )
        : null;
  }

  // Decide a good overlay (status bar icon) color based on app bar/background.
  SystemUiOverlayStyle _getOverlayStyle(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveColor =
        appBarBackgroundColor ??
        theme.appBarTheme.backgroundColor ??
        theme.colorScheme.surface;
    final brightness = ThemeData.estimateBrightnessForColor(effectiveColor);

    return brightness == Brightness.light
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;

    // - Helpers
  }
}
