/// This is the configuration of store , eg: Google play.
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
