/// This is the configuration of headline text.
class AdHeadlineConfig {
  final bool visible;
  final int fontSize;

  /// hex color code required
  final String textColor;

  AdHeadlineConfig({
    this.visible = true,
    this.fontSize = 13,
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
