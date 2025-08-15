// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// Directory path: assets/icons/home
  $AssetsIconsHomeGen get home => const $AssetsIconsHomeGen();

  /// Directory path: assets/icons/paywall
  $AssetsIconsPaywallGen get paywall => const $AssetsIconsPaywallGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/home
  $AssetsImagesHomeGen get home => const $AssetsImagesHomeGen();

  /// Directory path: assets/images/onboarding
  $AssetsImagesOnboardingGen get onboarding =>
      const $AssetsImagesOnboardingGen();

  /// Directory path: assets/images/paywall
  $AssetsImagesPaywallGen get paywall => const $AssetsImagesPaywallGen();
}

class $AssetsIconsHomeGen {
  const $AssetsIconsHomeGen();

  /// File path: assets/icons/home/arrow-ios-forward.svg
  String get arrowIosForward => 'assets/icons/home/arrow-ios-forward.svg';

  /// File path: assets/icons/home/diagnose_icon.svg
  String get diagnoseIcon => 'assets/icons/home/diagnose_icon.svg';

  /// File path: assets/icons/home/home_icon.svg
  String get homeIcon => 'assets/icons/home/home_icon.svg';

  /// File path: assets/icons/home/message_icon.svg
  String get messageIcon => 'assets/icons/home/message_icon.svg';

  /// File path: assets/icons/home/my_garden_icon.svg
  String get myGardenIcon => 'assets/icons/home/my_garden_icon.svg';

  /// File path: assets/icons/home/profile_icon.svg
  String get profileIcon => 'assets/icons/home/profile_icon.svg';

  /// File path: assets/icons/home/scan_icon.svg
  String get scanIcon => 'assets/icons/home/scan_icon.svg';

  /// File path: assets/icons/home/search_icon.svg
  String get searchIcon => 'assets/icons/home/search_icon.svg';

  /// List of all assets
  List<String> get values => [
    arrowIosForward,
    diagnoseIcon,
    homeIcon,
    messageIcon,
    myGardenIcon,
    profileIcon,
    scanIcon,
    searchIcon,
  ];
}

class $AssetsIconsPaywallGen {
  const $AssetsIconsPaywallGen();

  /// File path: assets/icons/paywall/better_results_icon.svg
  String get betterResultsIcon =>
      'assets/icons/paywall/better_results_icon.svg';

  /// File path: assets/icons/paywall/close_icon.svg
  String get closeIcon => 'assets/icons/paywall/close_icon.svg';

  /// File path: assets/icons/paywall/detailed_icon.svg
  String get detailedIcon => 'assets/icons/paywall/detailed_icon.svg';

  /// File path: assets/icons/paywall/faster_icon.svg
  String get fasterIcon => 'assets/icons/paywall/faster_icon.svg';

  /// File path: assets/icons/paywall/unlimited_icon.svg
  String get unlimitedIcon => 'assets/icons/paywall/unlimited_icon.svg';

  /// List of all assets
  List<String> get values => [
    betterResultsIcon,
    closeIcon,
    detailedIcon,
    fasterIcon,
    unlimitedIcon,
  ];
}

class $AssetsImagesHomeGen {
  const $AssetsImagesHomeGen();

  /// File path: assets/images/home/home_header.png
  AssetGenImage get homeHeader =>
      const AssetGenImage('assets/images/home/home_header.png');

  /// List of all assets
  List<AssetGenImage> get values => [homeHeader];
}

class $AssetsImagesOnboardingGen {
  const $AssetsImagesOnboardingGen();

  /// File path: assets/images/onboarding/onboard_1.png
  AssetGenImage get onboard1 =>
      const AssetGenImage('assets/images/onboarding/onboard_1.png');

  /// File path: assets/images/onboarding/onboard_1_bg.png
  AssetGenImage get onboard1Bg =>
      const AssetGenImage('assets/images/onboarding/onboard_1_bg.png');

  /// File path: assets/images/onboarding/onboard_2.png
  AssetGenImage get onboard2 =>
      const AssetGenImage('assets/images/onboarding/onboard_2.png');

  /// File path: assets/images/onboarding/onboard_3.png
  AssetGenImage get onboard3 =>
      const AssetGenImage('assets/images/onboarding/onboard_3.png');

  /// File path: assets/images/onboarding/onboard_brush.png
  AssetGenImage get onboardBrush =>
      const AssetGenImage('assets/images/onboarding/onboard_brush.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    onboard1,
    onboard1Bg,
    onboard2,
    onboard3,
    onboardBrush,
  ];
}

class $AssetsImagesPaywallGen {
  const $AssetsImagesPaywallGen();

  /// File path: assets/images/paywall/paywall_bg.png
  AssetGenImage get paywallBg =>
      const AssetGenImage('assets/images/paywall/paywall_bg.png');

  /// List of all assets
  List<AssetGenImage> get values => [paywallBg];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
