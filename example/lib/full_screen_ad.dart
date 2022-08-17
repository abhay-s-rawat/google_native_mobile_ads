import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:google_native_mobile_ads/google_native_mobile_ads.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'get_ad_widget.dart';

class FullScreenNativeAdScreen extends StatefulWidget {
  const FullScreenNativeAdScreen({Key? key}) : super(key: key);

  @override
  State<FullScreenNativeAdScreen> createState() =>
      _FullScreenNativeAdScreenState();
}

class _FullScreenNativeAdScreenState extends State<FullScreenNativeAdScreen> {
  List<Widget> adsList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
  }

  _initialize() {
    for (var i = 0; i < 10; i++) {
      adsList.add(GetNativeAdWidget(
        adUnitId: 'ca-app-pub-3940256099942544/2247696110',
        customOptions:
            NativeAdCustomOptions.defaultConfig(NativeAdSize.fullScreen).toMap,
      ));
    }
    setState(() {});
  }

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
/*       body: GetNativeAdWidget(
        adUnitId: 'ca-app-pub-3940256099942544/2247696110',
        customOptions: NativeAdCustomOptions.defaultConfig().toMap,
      ), */
      body: PreloadPageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        preloadPagesCount: 2,
        itemCount: adsList.length,
        itemBuilder: (context, index) {
          return adsList.elementAt(index);
        },
      ),
    );
  }
}
