import '../enums.dart';

/// This is the configuration of layout
/// In case of inline ad ad all the height to the parent container widget.
/// Container height mediaContentHeight +adTileHeight +adActionHeight +10 margin pixels
class AdLayoutConfig {
  /// Image/Video content height
  final int mediaContentHeight;

  /// Tile height that will show advertiser id/stars/store
  final int adTileHeight;

  /// Action container height that contains body and button
  final int adActionHeight;

  /// Ad tile contents will align from this parameter
  final BoxContentAlignment adTileAlignment;

  AdLayoutConfig({
    this.mediaContentHeight = 250,
    this.adTileHeight = 70,
    this.adActionHeight = 50,
    this.adTileAlignment = BoxContentAlignment.top,
  });

  Map<String, Object> get toMap {
    return {
      'mediaContentHeight': mediaContentHeight,
      'adTileHeight': adTileHeight,
      'adActionHeight': adActionHeight,
      'adTileAlignment': () {
        switch (adTileAlignment) {
          case BoxContentAlignment.top:
            return 'top';
          case BoxContentAlignment.bottom:
            return 'bottom';
        }
      }(),
    };
  }
}
