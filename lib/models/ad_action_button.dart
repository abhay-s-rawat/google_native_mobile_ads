/// This is the configuration of button that will do a action ,eg: INSTALL app, VISIT website, DOWNLOAD app.
///
class AdActionButtonConfig {
  final bool visible;

  /// hex color code required
  final String textColor;

  /// hex color code required
  final String buttonColor;
  final int fontSize;

  AdActionButtonConfig({
    this.visible = true,
    this.textColor = '#FFFFFF',
    this.buttonColor = '#0747A1',
    this.fontSize = 12,
  });

  Map<String, Object> get toMap {
    return {
      'visible': visible,
      'textColor': textColor.toLowerCase(),
      'buttonColor': buttonColor.toLowerCase(),
      'fontSize': fontSize,
    };
  }
}
