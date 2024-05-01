enum Flavor {
  dev,
  stg,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return '[DEV] Kelas Digital';
      case Flavor.stg:
        return '[STG] Kelas Digital';
      case Flavor.prod:
        return 'Kelas Digital';
      default:
        return 'title';
    }
  }

  static String get url {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://kc-develop.dev-backend.kelas-digital.id';
      case Flavor.stg:
        return 'https://staging-be.kelas-digital.id';
      case Flavor.prod:
        return 'https://be.kelas-digital.id';
      default:
        return 'title';
    }
  }
}
