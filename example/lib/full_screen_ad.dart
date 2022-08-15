import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_native_mobile_ads/google_native_mobile_ads.dart';

import 'get_ad_widget.dart';

class FullScreenNativeAdScreen extends StatefulWidget {
  const FullScreenNativeAdScreen({Key? key}) : super(key: key);

  @override
  State<FullScreenNativeAdScreen> createState() =>
      _FullScreenNativeAdScreenState();
}

class _FullScreenNativeAdScreenState extends State<FullScreenNativeAdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Sponsored',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetNativeAdWidget(
        adUnitId: 'ca-app-pub-3940256099942544/2247696110',
        customOptions: NativeAdCustomOptions.defaultConfig().toMap,
      ),
    );
  }
}
