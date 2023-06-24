class AppConfig {
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;

  AppConfig({
    required this.baseUrl,
    required this.connectTimeout,
    required this.receiveTimeout,
  });
}
