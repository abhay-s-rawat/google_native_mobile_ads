package com.example.google_native_mobile_ads_example;

import com.example.google_native_mobile_ads.NativeAdFactoryImplementation;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        final GoogleMobileAdsPlugin.NativeAdFactory factory = new NativeAdFactoryImplementation(getLayoutInflater());
        GoogleMobileAdsPlugin.registerNativeAdFactory(flutterEngine, "google_native_mobile_ads_AdFactory", factory);
    }

    @Override
    public void cleanUpFlutterEngine(FlutterEngine flutterEngine) {
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "google_native_mobile_ads_AdFactory");
    }
}
