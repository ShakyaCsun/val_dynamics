// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsCsvGen {
  const $AssetsCsvGen();

  /// Directory path: assets/csv/agents
  $AssetsCsvAgentsGen get agents => const $AssetsCsvAgentsGen();

  /// Directory path: assets/csv/matches
  $AssetsCsvMatchesGen get matches => const $AssetsCsvMatchesGen();
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/github-mark-white.svg
  SvgGenImage get githubMarkWhite =>
      const SvgGenImage.vec('assets/icons/github-mark-white.svg');

  /// File path: assets/icons/github-mark.svg
  SvgGenImage get githubMark =>
      const SvgGenImage.vec('assets/icons/github-mark.svg');

  /// List of all assets
  List<SvgGenImage> get values => [githubMarkWhite, githubMark];
}

class $AssetsCsvAgentsGen {
  const $AssetsCsvAgentsGen();

  /// File path: assets/csv/agents/agent_ratings_2023.csv
  String get agentRatings2023 => 'assets/csv/agents/agent_ratings_2023.csv';

  /// List of all assets
  List<String> get values => [agentRatings2023];
}

class $AssetsCsvMatchesGen {
  const $AssetsCsvMatchesGen();

  /// File path: assets/csv/matches/2023 Masters Tokyo and Champions.csv
  String get a2023MastersTokyoAndChampions =>
      'assets/csv/matches/2023 Masters Tokyo and Champions.csv';

  /// File path: assets/csv/matches/2024 Game Changers and Ascension.csv
  String get a2024GameChangersAndAscension =>
      'assets/csv/matches/2024 Game Changers and Ascension.csv';

  /// File path: assets/csv/matches/2024 July-December.csv
  String get a2024JulyDecember => 'assets/csv/matches/2024 July-December.csv';

  /// File path: assets/csv/matches/2024 VCT Season.csv
  String get a2024VCTSeason => 'assets/csv/matches/2024 VCT Season.csv';

  /// File path: assets/csv/matches/2025 Jan-April.csv
  String get a2025JanApril => 'assets/csv/matches/2025 Jan-April.csv';

  /// File path: assets/csv/matches/2025 Kickoff and Masters Bangkok.csv
  String get a2025KickoffAndMastersBangkok =>
      'assets/csv/matches/2025 Kickoff and Masters Bangkok.csv';

  /// File path: assets/csv/matches/2025 Masters Toronto.csv
  String get a2025MastersToronto =>
      'assets/csv/matches/2025 Masters Toronto.csv';

  /// File path: assets/csv/matches/2025 VCT Stage 1.csv
  String get a2025VCTStage1 => 'assets/csv/matches/2025 VCT Stage 1.csv';

  /// List of all assets
  List<String> get values => [
    a2023MastersTokyoAndChampions,
    a2024GameChangersAndAscension,
    a2024JulyDecember,
    a2024VCTSeason,
    a2025JanApril,
    a2025KickoffAndMastersBangkok,
    a2025MastersToronto,
    a2025VCTStage1,
  ];
}

abstract final class Assets {
  static const $AssetsCsvGen csv = $AssetsCsvGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
