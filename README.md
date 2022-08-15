<p >
<a href="https://www.buymeacoffee.com/abhayrawat" target="_blank"><img align="center" src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="30px" width= "108px"></a>
</p> 

# Full screen native ad

This only supports fullscreen native ads on android.

Liked my work ? [support me](https://www.buymeacoffee.com/abhayrawat)

## Setup
While setting up google mobile ads just change the adfactory implementation defined in this package.
your Mainactivity.java should look like the following.
```
package com.example.google_native_mobile_ads_example;
import com.example.google_native_mobile_ads.NativeAdFactoryImplementation;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        final GoogleMobileAdsPlugin.NativeAdFactory factory = new NativeAdFactoryImplementation(getLayoutInflater()); // reference to this package created factory
        GoogleMobileAdsPlugin.registerNativeAdFactory(flutterEngine, "fullScreenNativeAdFactory", factory);
    }

    @Override
    public void cleanUpFlutterEngine(FlutterEngine flutterEngine) {
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "fullScreenNativeAdFactory");
    }
}
```
Add application id in AndroidManifest.xml
```
<application>
...
<meta-data
            android:name="com.google.android.gms.ads.APPLICATION_ID"
            android:value="YOUR-APPLICATION-ID"/>
            ...
    </application>
```
## How to use on flutter side
for full example please view example/main.dart
```dart
    nativeAd = NativeAd(
      adUnitId: widget.adUnitId,

      /// This does the job to show fullscreen ads
      customOptions: NativeAdCustomOptions.defaultConfig().toMap, // This does the job to show full screen ad
      nativeAdOptions: NativeAdOptions(
        adChoicesPlacement: AdChoicesPlacement.topLeftCorner,
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
      factoryId: NativeAdConfig.adFactoryId, // This is also required
      ...
```
## Screenshots
![](https://github.com/abhay-s-rawat/google_native_mobile_ads/blob/main/example/screenshots/native_full_screen.png) ![](https://github.com/abhay-s-rawat/google_native_mobile_ads/blob/main/example/screenshots/native_full_screen2.png)
