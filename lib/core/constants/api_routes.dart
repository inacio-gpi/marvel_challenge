abstract class ApiRoutes {
  static const String baseUrl = 'https://gateway.marvel.com:443';

  static const String _apiVersion = '/v1/';

  static const String _status = '$_apiVersion/public';

  static const String characters = '$_status/characters';
}
