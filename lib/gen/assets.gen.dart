/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class Assets {
  Assets._();

  static const AssetGenImage binarySearch =
      AssetGenImage('assets/binary_search.webp');
  static const AssetGenImage bubbleSort =
      AssetGenImage('assets/bubble_sort.webp');
  static const AssetGenImage countingSort =
      AssetGenImage('assets/counting_sort.webp');
  static const AssetGenImage graphTraversal =
      AssetGenImage('assets/graph_traversal.webp');
  static const AssetGenImage heapSort = AssetGenImage('assets/heap_sort.webp');
  static const AssetGenImage insertionSort =
      AssetGenImage('assets/insertion_sort.webp');
  static const AssetGenImage linearSearch =
      AssetGenImage('assets/linear_search.webp');
  static const AssetGenImage mergeSort =
      AssetGenImage('assets/merge_sort.webp');
  static const AssetGenImage quickSort =
      AssetGenImage('assets/quick_sort.webp');
  static const AssetGenImage radix = AssetGenImage('assets/radix.webp');
  static const AssetGenImage searching = AssetGenImage('assets/searching.webp');
  static const AssetGenImage selectionSort =
      AssetGenImage('assets/selection_sort.webp');
  static const AssetGenImage sorting = AssetGenImage('assets/sorting.webp');

  /// List of all assets
  static List<AssetGenImage> get values => [
        binarySearch,
        bubbleSort,
        countingSort,
        graphTraversal,
        heapSort,
        insertionSort,
        linearSearch,
        mergeSort,
        quickSort,
        radix,
        searching,
        selectionSort,
        sorting
      ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

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
