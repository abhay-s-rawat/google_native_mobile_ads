/// Custom options builder

import 'models/ad_action_button.dart';
import 'models/ad_advertiser.dart';
import 'models/ad_body.dart';
import 'models/ad_headline.dart';
import 'models/ad_icon.dart';
import 'models/ad_price.dart';
import 'models/ad_stars.dart';
import 'models/ad_store.dart';

class NativeAdCustomOptions {
  final AdStarsConfig adStarsConfig;
  final AdPriceConfig adPriceConfig;
  final AdStoreConfig adStoreConfig;
  final AdHeadlineConfig adHeadlineConfig;
  final AdAdvertiserConfig adAdvertiserConfig;
  final AdIconConfig adIconConfig;
  final AdBodyConfig adBodyConfig;
  final AdActionButtonConfig adActionButtonConfig;
  final String backgroundColor;

  NativeAdCustomOptions({
    required this.adStarsConfig,
    required this.adPriceConfig,
    required this.adStoreConfig,
    required this.adHeadlineConfig,
    required this.adAdvertiserConfig,
    required this.adIconConfig,
    required this.adBodyConfig,
    required this.adActionButtonConfig,
    this.backgroundColor = "#000000",
  });

  /// Generates default options
  static NativeAdCustomOptions defaultConfig({
    AdStarsConfig? adStarsConfig,
    AdPriceConfig? adPriceConfig,
    AdStoreConfig? adStoreConfig,
    AdHeadlineConfig? adHeadlineConfig,
    AdAdvertiserConfig? adAdvertiserConfig,
    AdIconConfig? adIconConfig,
    AdBodyConfig? adBodyConfig,
    AdActionButtonConfig? adActionButtonConfig,
    String backgroundColor = "#000000",
  }) {
    return NativeAdCustomOptions(
      adStarsConfig: adStarsConfig ?? AdStarsConfig(),
      adPriceConfig: adPriceConfig ?? AdPriceConfig(),
      adStoreConfig: adStoreConfig ?? AdStoreConfig(),
      adHeadlineConfig: adHeadlineConfig ?? AdHeadlineConfig(),
      adAdvertiserConfig: adAdvertiserConfig ?? AdAdvertiserConfig(),
      adIconConfig: adIconConfig ?? AdIconConfig(),
      adBodyConfig: adBodyConfig ?? AdBodyConfig(),
      adActionButtonConfig: adActionButtonConfig ?? AdActionButtonConfig(),
      backgroundColor: backgroundColor,
    );
  }

  /// Convert to map to pass to customOptions in NativeAd
  Map<String, Object> get toMap {
    return {
      'adStarsConfig': adStarsConfig.toMap,
      'adPriceConfig': adPriceConfig.toMap,
      'adStoreConfig': adStoreConfig.toMap,
      'adHeadlineConfig': adHeadlineConfig.toMap,
      'adAdvertiserConfig': adAdvertiserConfig.toMap,
      'adIconConfig': adIconConfig.toMap,
      'adBodyConfig': adBodyConfig.toMap,
      'adActionButtonConfig': adActionButtonConfig.toMap,
      'backgroundColor': backgroundColor,
    };
  }
}
