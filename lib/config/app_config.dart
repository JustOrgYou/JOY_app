class AppConfig {
  final String baseUrl;
  final String mlUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final String authToken;

  AppConfig({
    required this.mlUrl,
    required this.baseUrl,
    required this.connectTimeout,
    required this.receiveTimeout,
    required this.authToken,
  });
}
