class Constant {
  static const SERVER_URL = 'https://prod-service.ontime.mn';

  static const _contactSuffix = '$SERVER_URL/customers/contracts';

  static String get contract => _contactSuffix;
}
