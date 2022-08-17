/// This is the configuration of media that will show up as image/video.
class AdMediaConfig {
  final bool visible;

  AdMediaConfig({
    this.visible = true,
  });

  Map<String, Object> get toMap {
    return {
      'visible': visible,
    };
  }
}
