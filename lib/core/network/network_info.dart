import 'package:marvel/core/network/network_channel.dart';

abstract class IInternetInfo {
  Future<bool?> isConnected();
}

class InternetInfo implements IInternetInfo {
  final InternetPlatformChannel _connectionChecker;

  InternetInfo({required InternetPlatformChannel connectionChecker})
      : _connectionChecker = connectionChecker;

  @override
  Future<bool?> isConnected() async =>
      await _connectionChecker.callInternetMethodChannel();
}
