/// This is the configuration of layout
/// In case of inline ad ad all the height to the parent container widget.
/// Container height mediaContentHeight +adTileHeight +adActionHeight +10 margin pixels
class AdLayoutConfig {
  final int mediaContentHeight;
  final int adTileHeight;
  final int adActionHeight;

  AdLayoutConfig({
    this.mediaContentHeight = 250,
    this.adTileHeight = 70,
    this.adActionHeight = 50,
  });

  Map<String, Object> get toMap {
    return {
      'mediaContentHeight': mediaContentHeight,
      'adTileHeight': adTileHeight,
      'adActionHeight': adActionHeight,
    };
  }
}
