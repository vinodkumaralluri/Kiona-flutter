/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/app_icon.svg
  String get appIcon => 'assets/icons/app_icon.svg';

  /// File path: assets/icons/clock_icon.svg
  String get clockIcon => 'assets/icons/clock_icon.svg';

  /// File path: assets/icons/send_icon.svg
  String get sendIcon => 'assets/icons/send_icon.svg';

  /// File path: assets/icons/share_icon.svg
  String get shareIcon => 'assets/icons/share_icon.svg';

  /// List of all assets
  List<String> get values => [appIcon, clockIcon, sendIcon, shareIcon];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/dotted_container.svg
  String get dottedContainer => 'assets/images/dotted_container.svg';

  /// File path: assets/images/home_screen_placeholder.svg
  String get homeScreenPlaceholder =>
      'assets/images/home_screen_placeholder.svg';

  /// File path: assets/images/pdf_attachments.svg
  String get pdfAttachments => 'assets/images/pdf_attachments.svg';

  /// File path: assets/images/profile_image.png
  AssetGenImage get profileImage =>
      const AssetGenImage('assets/images/profile_image.png');

  /// List of all assets
  List<dynamic> get values =>
      [dottedContainer, homeScreenPlaceholder, pdfAttachments, profileImage];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
