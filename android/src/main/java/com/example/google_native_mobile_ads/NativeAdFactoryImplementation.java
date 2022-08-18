package com.example.google_native_mobile_ads;

import android.content.Context;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.drawable.LayerDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RatingBar;
import android.widget.TextView;

import androidx.constraintlayout.widget.ConstraintLayout;

import com.google.android.gms.ads.nativead.MediaView;
import com.google.android.gms.ads.nativead.NativeAd;
import com.google.android.gms.ads.nativead.NativeAdView;

import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin.NativeAdFactory;

import java.util.Map;
enum NativeAdSize {
    fullScreen,
    inline
}
public class NativeAdFactoryImplementation implements NativeAdFactory {
    private final LayoutInflater layoutInflater;

    public NativeAdFactoryImplementation(LayoutInflater layoutInflater) {
        this.layoutInflater = layoutInflater;
    }
    public static int dpToPx(int dp, Context context) {
        float density = context.getResources().getDisplayMetrics().density;
        return Math.round((float) dp * density);
    }
    @Override
    public NativeAdView createNativeAd(NativeAd nativeAd, Map<String, Object> customOptions) {
        String adType = (String) customOptions.get("nativeAdSize");
        final NativeAdSize nativeAdSize;
        final NativeAdView adView;
                switch(adType) {
            case "inline":
                nativeAdSize = NativeAdSize.inline;
                adView = (NativeAdView) layoutInflater.inflate(R.layout.inline_native_ad, null);
                break;
            default:
                nativeAdSize = NativeAdSize.fullScreen;
                adView = (NativeAdView) layoutInflater.inflate(R.layout.full_screen_native_ad_layout, null);
                break;
        }
        Map<String, Object> adLayoutConfig = (Map<String, Object>) customOptions.get("adLayoutConfig");
        int backgroundColor = Color.parseColor((String) (customOptions.get("backgroundColor")));
        adView.setBackgroundColor(backgroundColor);
        // Media
        MediaView mediaView = (MediaView) adView.findViewById(R.id.ad_media_stack);
        adView.setMediaView(mediaView);
        Map<String, Object> adMediaConfig = (Map<String, Object>) customOptions.get("adMediaConfig");
        boolean hideAdMediaConfig = (nativeAd.getMediaContent() == null) || ((boolean) (adMediaConfig.get("visible")) == false);
        if (!hideAdMediaConfig) {
            mediaView.setVisibility(View.VISIBLE);
            adView.getMediaView().setMediaContent(nativeAd.getMediaContent());
            if(nativeAdSize == NativeAdSize.inline) {
                mediaView.getLayoutParams().height = dpToPx((int) adLayoutConfig.get("mediaContentHeight"), mediaView.getContext());
            }
        } else {
            mediaView.setVisibility(View.GONE);
        }
        // Headline
        adView.setHeadlineView(adView.findViewById(R.id.ad_headline));
        Map<String, Object> adHeadlineConfig = (Map<String, Object>) customOptions.get("adHeadlineConfig");
        TextView headLine = ((TextView) adView.getHeadlineView());
        headLine.setText(nativeAd.getHeadline());
        headLine.setTextSize((int) (adHeadlineConfig.get("fontSize")));
        headLine.setTextColor(Color.parseColor((String) (adHeadlineConfig.get("textColor"))));
        // Body
        adView.setBodyView(adView.findViewById(R.id.ad_body));
        Map<String, Object> adBodyConfig = (Map<String, Object>) customOptions.get("adBodyConfig");
        boolean hideAdBodyConfig = (nativeAd.getBody() == null) || ((boolean) (adBodyConfig.get("visible")) == false);
        TextView body = ((TextView) adView.getBodyView());
        if (hideAdBodyConfig) {
            body.setVisibility(View.GONE);
        } else {
            body.setVisibility(View.VISIBLE);
            body.setText(nativeAd.getBody());
            body.setTextSize((int) (adBodyConfig.get("fontSize")));
            body.setTextColor(Color.parseColor((String) (adBodyConfig.get("textColor"))));

        }
        // Advertiser
        adView.setAdvertiserView(adView.findViewById(R.id.ad_advertiser));
        Map<String, Object> adAdvertiserConfig = (Map<String, Object>) customOptions.get("adAdvertiserConfig");
        boolean hideAdAdvertiserConfig = (nativeAd.getAdvertiser() == null) || ((boolean) (adAdvertiserConfig.get("visible")) == false);
        TextView adv = ((TextView) adView.getAdvertiserView());
        if (hideAdAdvertiserConfig) {
            adv.setVisibility(View.GONE);
        } else {
            adv.setVisibility(View.VISIBLE);
            adv.setText(nativeAd.getAdvertiser());
            adv.setTextSize((int) (adAdvertiserConfig.get("fontSize")));
            adv.setTextColor(Color.parseColor((String) (adAdvertiserConfig.get("textColor"))));
        }
        // Ad Store
        adView.setStoreView(adView.findViewById(R.id.ad_store));
        Map<String, Object> adStoreConfig = (Map<String, Object>) customOptions.get("adStoreConfig");
        TextView store = ((TextView) adView.getStoreView());
        boolean hideAdStoreConfig = (nativeAd.getStore() == null) || ((boolean) (adStoreConfig.get("visible")) == false);
        if (hideAdStoreConfig) {
            store.setVisibility(View.GONE);
        } else {
            store.setVisibility(View.VISIBLE);
            store.setText(nativeAd.getStore());
            store.setTextSize((int) (adStoreConfig.get("fontSize")));
            store.setTextColor(Color.parseColor((String) (adStoreConfig.get("textColor"))));
        }
        // Price
        adView.setPriceView(adView.findViewById(R.id.ad_price));
        Map<String, Object> adPriceConfig = (Map<String, Object>) customOptions.get("adPriceConfig");
        TextView price = ((TextView) adView.getPriceView());
        boolean hideAdPriceConfig = (nativeAd.getPrice() == null) || ((boolean) (adPriceConfig.get("visible")) == false);
        if (hideAdPriceConfig) {
            price.setVisibility(View.GONE);
        } else {
            price.setVisibility(View.VISIBLE);
            price.setText("(" +nativeAd.getPrice() +")");
            price.setTextSize((int) (adPriceConfig.get("fontSize")));
            price.setTextColor(Color.parseColor((String) (adPriceConfig.get("textColor"))));
        }
        // Action button
        adView.setCallToActionView(adView.findViewById(R.id.ad_call_to_action));
        Map<String, Object> adActionButtonConfig = (Map<String, Object>) customOptions.get("adActionButtonConfig");
        Button action = ((Button) adView.getCallToActionView());
        int buttonTextColor = Color.parseColor((String) (adActionButtonConfig.get("textColor")));
        int buttonColor = Color.parseColor((String) (adActionButtonConfig.get("buttonColor")));
        boolean hideAdActionButtonConfig = (nativeAd.getCallToAction() == null) || ((boolean) (adActionButtonConfig.get("visible")) == false);
        if (hideAdActionButtonConfig) {
            action.setVisibility(View.GONE);
        } else {
            action.setVisibility(View.VISIBLE);
            action.setText(nativeAd.getCallToAction());
            action.setTextColor(buttonTextColor);
            action.setBackgroundColor(buttonColor);
            action.setTextSize((int) (adActionButtonConfig.get("fontSize")));
        }
        ConstraintLayout actionLayout = (ConstraintLayout) (adView.findViewById(R.id.ad_call_to_action_container));
        actionLayout.getLayoutParams().height = dpToPx((int) adLayoutConfig.get("adActionHeight"), actionLayout.getContext());
        actionLayout.setBackgroundColor(buttonColor);
        // Profile Icon
        adView.setIconView(adView.findViewById(R.id.ad_app_icon));
        Map<String, Object> adIconConfig = (Map<String, Object>) customOptions.get("adIconConfig");
        ImageView icon = ((ImageView) adView.getIconView());
        boolean hideAdIconConfig = (nativeAd.getIcon() == null) || ((boolean) (adIconConfig.get("visible")) == false);
        if (hideAdIconConfig) {
            icon.setVisibility(View.GONE);
        } else {
            icon.setImageDrawable(nativeAd.getIcon().getDrawable());
            icon.getLayoutParams().height = dpToPx((int) (adIconConfig.get("height")), icon.getContext());
            icon.getLayoutParams().width = dpToPx((int) (adIconConfig.get("width")), icon.getContext());
            icon.gra
            icon.setVisibility(View.VISIBLE);
        }
        // Profile Container Height
        LinearLayout native_ad_tile_container = (LinearLayout) (adView.findViewById(R.id.native_ad_tile_container));
        native_ad_tile_container.getLayoutParams().height = dpToPx((int) adLayoutConfig.get("adTileHeight"), native_ad_tile_container.getContext());
        // Stars
        adView.setStarRatingView(adView.findViewById(R.id.ad_stars));
        Map<String, Object> adStarsConfig = (Map<String, Object>) customOptions.get("adStarsConfig");
        RatingBar rating = (RatingBar) adView.getStarRatingView();
        boolean hideAdStarsConfig = (nativeAd.getStarRating() == null) || ((boolean) (adStarsConfig.get("visible")) == false);
        if (hideAdStarsConfig) {
            rating.setVisibility(View.GONE);
        } else {
            rating.setRating(nativeAd.getStarRating().floatValue());
            LayerDrawable stars = (LayerDrawable) rating.getProgressDrawable();
            int starsColor = Color.parseColor((String) (adStarsConfig.get("starsColor")));
            int emptyStarsColor = Color.parseColor((String) (adStarsConfig.get("emptyStarsColor")));
            stars.getDrawable(2).setColorFilter(starsColor, PorterDuff.Mode.SRC_ATOP);
            stars.getDrawable(0).setColorFilter(emptyStarsColor, PorterDuff.Mode.SRC_ATOP);
            stars.getDrawable(1).setColorFilter(emptyStarsColor, PorterDuff.Mode.SRC_ATOP);
            rating.setVisibility(View.VISIBLE);
        }
        if (hideAdStoreConfig && hideAdPriceConfig) {
            LinearLayout ad_store_details_container = (LinearLayout) (adView.findViewById(R.id.ad_store_details_container));
            ad_store_details_container.setVisibility(View.GONE);
        }
        if (hideAdActionButtonConfig && hideAdBodyConfig) {
            actionLayout.setVisibility(View.GONE);
        }
        adView.setNativeAd(nativeAd);
        return adView;
    }
}
