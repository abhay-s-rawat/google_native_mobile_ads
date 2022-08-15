/// This is the configuration of body text.
class AdBodyConfig {
  final bool visible;
  final int fontSize;

  /// hex color code required
  final String textColor;

  AdBodyConfig({
    this.visible = true,
    this.fontSize = 12,
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
