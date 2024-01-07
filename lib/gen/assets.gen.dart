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

  /// File path: assets/icons/back.svg
  String get back => 'assets/icons/back.svg';

  /// File path: assets/icons/briefcase.svg
  String get briefcase => 'assets/icons/briefcase.svg';

  /// File path: assets/icons/car_req.svg
  String get carReq => 'assets/icons/car_req.svg';

  /// File path: assets/icons/category_1.svg
  String get category1 => 'assets/icons/category_1.svg';

  /// File path: assets/icons/category_2.svg
  String get category2 => 'assets/icons/category_2.svg';

  /// File path: assets/icons/chalkboard.svg
  String get chalkboard => 'assets/icons/chalkboard.svg';

  /// File path: assets/icons/down.svg
  String get down => 'assets/icons/down.svg';

  /// File path: assets/icons/filter.svg
  String get filter => 'assets/icons/filter.svg';

  /// File path: assets/icons/garage.svg
  String get garage => 'assets/icons/garage.svg';

  /// File path: assets/icons/location.svg
  String get location => 'assets/icons/location.svg';

  /// File path: assets/icons/map.svg
  String get map => 'assets/icons/map.svg';

  /// File path: assets/icons/message.svg
  String get message => 'assets/icons/message.svg';

  /// File path: assets/icons/request.svg
  String get request => 'assets/icons/request.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// File path: assets/icons/search_fill.svg
  String get searchFill => 'assets/icons/search_fill.svg';

  /// File path: assets/icons/sofol.svg
  String get sofol => 'assets/icons/sofol.svg';

  /// File path: assets/icons/star.svg
  String get star => 'assets/icons/star.svg';

  /// File path: assets/icons/student.svg
  String get student => 'assets/icons/student.svg';

  /// List of all assets
  List<String> get values => [
        back,
        briefcase,
        carReq,
        category1,
        category2,
        chalkboard,
        down,
        filter,
        garage,
        location,
        map,
        message,
        request,
        search,
        searchFill,
        sofol,
        star,
        student
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/featured_graphics_1.png
  AssetGenImage get featuredGraphics1 =>
      const AssetGenImage('assets/images/featured_graphics_1.png');

  /// File path: assets/images/nagalay_logo_1.png
  AssetGenImage get nagalayLogo1 =>
      const AssetGenImage('assets/images/nagalay_logo_1.png');

  /// File path: assets/images/place_holder_1.png
  AssetGenImage get placeHolder1 =>
      const AssetGenImage('assets/images/place_holder_1.png');

  /// File path: assets/images/placeholder_2.png
  AssetGenImage get placeholder2 =>
      const AssetGenImage('assets/images/placeholder_2.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [featuredGraphics1, nagalayLogo1, placeHolder1, placeholder2];
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
