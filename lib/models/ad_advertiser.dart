/// This is the configuration of advertiser text.
class AdAdvertiserConfig {
  final bool visible;
  final int fontSize;

  /// hex color code required
  final String textColor;

  AdAdvertiserConfig({
    this.visible = true,
    this.fontSize = 14,
    this.textColor = '#FFFFFF',
  });

  Map<String, Object> get toMap {
    return {
      'visible': visible,
      'fontSize': fontSize,
      'textColor': textColor.toLowerCase(),
    };
  }
}
