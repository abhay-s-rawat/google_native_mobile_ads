/// This is the configuration of advertiser icon.
class AdIconConfig {
  final bool visible;

  /// height in dp
  final int height;

  /// width in dp
  final int width;

  AdIconConfig({
    this.visible = true,
    this.height = 50,
    this.width = 50,
  });

  Map<String, Object> get toMap {
    return {
      'visible': visible,
      'height': height,
      'width': width,
    };
  }
}
