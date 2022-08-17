import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_native_mobile_ads/google_native_mobile_ads.dart';

class GetNativeAdWidget extends StatefulWidget {
  final String adUnitId;
  final Map<String, Object>? customOptions;
  const GetNativeAdWidget({
    Key? key,
    required this.adUnitId,
    this.customOptions,
  }) : super(key: key);

  @override
  State<GetNativeAdWidget> createState() => _GetNativeAdWidgetState();
}

class _GetNativeAdWidgetState extends State<GetNativeAdWidget> {
  NativeAd? nativeAd;
  bool nativeAdIsLoaded = false;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeAd();
  }

  @override
  void dispose() {
    super.dispose();
    nativeAd?.dispose();
  }

  _initializeAd() {
    hasError = false;
    nativeAd = NativeAd(
      adUnitId: widget.adUnitId,

      /// This does the job to show fullscreen ads
      customOptions: widget.customOptions,
      nativeAdOptions: NativeAdOptions(
        adChoicesPlacement: AdChoicesPlacement.bottomLeftCorner,
        mediaAspectRatio: MediaAspectRatio.any,
        videoOptions: VideoOptions(
          clickToExpandRequested: true,
          customControlsRequested: true,
          startMuted: true,
        ),
        //shouldRequestMultipleImages: true,
      ),
      request: const AdRequest(),

      /// This needs not to be changed
      factoryId: NativeAdConfig.adFactoryId,
      listener: NativeAdListener(
        onAdLoaded: (Ad ad) async {
          print('$NativeAd loaded.');
          if (mounted) {
            setState(() {
              hasError = false;
              nativeAdIsLoaded = true;
            });
          }
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$NativeAd failedToLoad: $error');
          if (error.code == 3) {
            print('google out of ads for this config.');
          }
          if (mounted) {
            setState(() {
              hasError = true;
            });
          }
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$NativeAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$NativeAd onAdClosed.'),
      ),
    )..load();
  }

  Widget get _adWidget {
    if (hasError) {
      return const Center(
          child: Text(
        'Failed to load ad',
        style: TextStyle(color: Colors.white),
      ));
    }
    if (nativeAdIsLoaded) {
      return AdWidget(ad: nativeAd!);
    }
    return Center(
      child: SpinKitFadingCube(
        color: Theme.of(context).primaryColor,
        size: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _adWidget;
  }
}
