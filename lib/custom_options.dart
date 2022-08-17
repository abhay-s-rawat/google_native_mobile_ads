/// Custom options builder

import 'enums.dart';
import 'models/ad_action_button.dart';
import 'models/ad_advertiser.dart';
import 'models/ad_body.dart';
import 'models/ad_headline.dart';
import 'models/ad_icon.dart';
import 'models/ad_layout.dart';
import 'models/ad_media.dart';
import 'models/ad_price.dart';
import 'models/ad_stars.dart';
import 'models/ad_store.dart';

class NativeAdCustomOptions {
  final NativeAdSize nativeAdSize;
  final AdStarsConfig adStarsConfig;
  final AdPriceConfig adPriceConfig;
  final AdStoreConfig adStoreConfig;
  final AdHeadlineConfig adHeadlineConfig;
  final AdAdvertiserConfig adAdvertiserConfig;
  final AdIconConfig adIconConfig;
  final AdBodyConfig adBodyConfig;
  final AdActionButtonConfig adActionButtonConfig;
  final String backgroundColor;
  final AdLayoutConfig adLayoutConfig;
  final AdMediaConfig adMediaConfig;

  NativeAdCustomOptions(
    this.nativeAdSize, {
    required this.adStarsConfig,
    required this.adPriceConfig,
    required this.adStoreConfig,
    required this.adHeadlineConfig,
    required this.adAdvertiserConfig,
    required this.adIconConfig,
    required this.adBodyConfig,
    required this.adActionButtonConfig,
    required this.adLayoutConfig,
    required this.adMediaConfig,
    this.backgroundColor = "#000000",
  });

  /// Generates default options
  static NativeAdCustomOptions defaultConfig(
    NativeAdSize nativeAdSize, {
    AdStarsConfig? adStarsConfig,
    AdPriceConfig? adPriceConfig,
    AdStoreConfig? adStoreConfig,
    AdHeadlineConfig? adHeadlineConfig,
    AdAdvertiserConfig? adAdvertiserConfig,
    AdIconConfig? adIconConfig,
    AdBodyConfig? adBodyConfig,
    AdActionButtonConfig? adActionButtonConfig,
    String backgroundColor = "#000000",
    AdLayoutConfig? adLayoutConfig,
    AdMediaConfig? adMediaConfig,
  }) {
    return NativeAdCustomOptions(
      nativeAdSize,
      adStarsConfig: adStarsConfig ?? AdStarsConfig(),
      adPriceConfig: adPriceConfig ?? AdPriceConfig(),
      adStoreConfig: adStoreConfig ?? AdStoreConfig(),
      adHeadlineConfig: adHeadlineConfig ?? AdHeadlineConfig(),
      adAdvertiserConfig: adAdvertiserConfig ?? AdAdvertiserConfig(),
      adIconConfig: adIconConfig ?? AdIconConfig(),
      adBodyConfig: adBodyConfig ?? AdBodyConfig(),
      adActionButtonConfig: adActionButtonConfig ?? AdActionButtonConfig(),
      adLayoutConfig: adLayoutConfig ?? AdLayoutConfig(),
      adMediaConfig: adMediaConfig ?? AdMediaConfig(),
      backgroundColor: backgroundColor,
    );
  }

  double get getInlineAdHeight {
    int height = 0;
    if (adMediaConfig.visible) {
      height = height + adLayoutConfig.mediaContentHeight;
    }
    if (adActionButtonConfig.visible || adBodyConfig.visible) {
      height = height + adLayoutConfig.adActionHeight;
    }
    if (adIconConfig.visible ||
        adStarsConfig.visible ||
        adPriceConfig.visible ||
        adStoreConfig.visible ||
        adHeadlineConfig.visible ||
        adAdvertiserConfig.visible) {
      height = height + adLayoutConfig.adTileHeight;
    }
    if (height != 0) {
      height = height + 10;
    }
    return height.toDouble();
  }

  /// Convert to map to pass to customOptions in NativeAd
  Map<String, Object> get toMap {
    return {
      'nativeAdSize': () {
        switch (nativeAdSize) {
          case NativeAdSize.fullScreen:
            return 'fullScreen';
          case NativeAdSize.inline:
            return 'inline';
        }
      }(),
      'adMediaConfig': adMediaConfig.toMap,
      'adStarsConfig': adStarsConfig.toMap,
      'adPriceConfig': adPriceConfig.toMap,
      'adStoreConfig': adStoreConfig.toMap,
      'adHeadlineConfig': adHeadlineConfig.toMap,
      'adAdvertiserConfig': adAdvertiserConfig.toMap,
      'adIconConfig': adIconConfig.toMap,
      'adBodyConfig': adBodyConfig.toMap,
      'adActionButtonConfig': adActionButtonConfig.toMap,
      'backgroundColor': backgroundColor,
      'adLayoutConfig': adLayoutConfig.toMap,
    };
  }
}
