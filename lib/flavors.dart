enum Flavor {
  development,
  staging,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.development:
        return 'Spotify Dev';
      case Flavor.staging:
        return 'Spotify Staging';
      case Flavor.production:
        return 'Spotify Prod';
      default:
        return 'title';
    }
  }

  static String get tokenApiBase {
    switch (appFlavor) {
      case Flavor.development:
        return 'https://accounts.spotify.com/api';
      case Flavor.staging:
        return 'https://accounts.spotify.com/api';
      case Flavor.production:
        return 'https://accounts.spotify.com/api';
      default:
        return 'title';
    }
  }

  static String get apiBase {
    switch (appFlavor) {
      case Flavor.development:
        return 'https://api.spotify.com/v1';
      case Flavor.staging:
        return 'https://api.spotify.com/v1';
      case Flavor.production:
        return 'https://api.spotify.com/v1';
      default:
        return 'title';
    }
  }
}
