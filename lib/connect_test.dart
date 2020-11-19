
import 'dart:async';

import 'package:flutter/services.dart';

class ConnectTest {
  static const MethodChannel _channel =
      const MethodChannel('connect_test');

  static const String WLAUTHORIZATIONMANAGER_OBTAINACCESSTOKEN =
      "obtainAccessToken";
  static const String SCOPE = "scope";

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<Map> obtainAccessToken({String scope}) async {
    final Map token = await _channel.invokeMethod(
        WLAUTHORIZATIONMANAGER_OBTAINACCESSTOKEN,
        <String, dynamic>{SCOPE: scope});
    return token;
  }

  Future<Map> obtainAccessTokenTest({String scope}) async {
    final Map token = await _channel.invokeMethod(
        WLAUTHORIZATIONMANAGER_OBTAINACCESSTOKEN,
        <String, dynamic>{SCOPE: scope});
    return token;
  }
}
