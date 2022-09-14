import 'package:flutter/services.dart';

class InternetPlatformChannel {
  var platform = const MethodChannel('unique.identifier.method/network');

  Future<bool?> callInternetMethodChannel() async =>
      await platform.invokeMethod('verifyInternet');
}
