// Autogenerated from Pigeon (v0.1.15), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import
// @dart = 2.8
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:typed_data' show Uint8List, Int32List, Int64List, Float64List;

class WifiResponse {
  bool availableDetect;
  bool availableWifi;
  bool availableMobile;
  // ignore: unused_element
  Map<dynamic, dynamic> _toMap() {
    final Map<dynamic, dynamic> pigeonMap = <dynamic, dynamic>{};
    pigeonMap['availableDetect'] = availableDetect;
    pigeonMap['availableWifi'] = availableWifi;
    pigeonMap['availableMobile'] = availableMobile;
    return pigeonMap;
  }
  // ignore: unused_element
  static WifiResponse _fromMap(Map<dynamic, dynamic> pigeonMap) {
    final WifiResponse result = WifiResponse();
    result.availableDetect = pigeonMap['availableDetect'];
    result.availableWifi = pigeonMap['availableWifi'];
    result.availableMobile = pigeonMap['availableMobile'];
    return result;
  }
}

class WifiRequest {
  bool isDetect;
  // ignore: unused_element
  Map<dynamic, dynamic> _toMap() {
    final Map<dynamic, dynamic> pigeonMap = <dynamic, dynamic>{};
    pigeonMap['isDetect'] = isDetect;
    return pigeonMap;
  }
  // ignore: unused_element
  static WifiRequest _fromMap(Map<dynamic, dynamic> pigeonMap) {
    final WifiRequest result = WifiRequest();
    result.isDetect = pigeonMap['isDetect'];
    return result;
  }
}

abstract class CallbackApi {
  void apply(WifiResponse arg);
  static void setup(CallbackApi api) {
    {
      const BasicMessageChannel<dynamic> channel =
          BasicMessageChannel<dynamic>('dev.flutter.pigeon.CallbackApi.apply', StandardMessageCodec());
      if (api == null) {
        channel.setMessageHandler(null);
      } else {

        channel.setMessageHandler((dynamic message) async {
          final Map<dynamic, dynamic> mapMessage = message as Map<dynamic, dynamic>;
          final WifiResponse input = WifiResponse._fromMap(mapMessage);
          api.apply(input);
        });
      }
    }
  }
}

class Api {
  Future<WifiResponse> call(WifiRequest arg) async {
    final Map<dynamic, dynamic> requestMap = arg._toMap();
    const BasicMessageChannel<dynamic> channel =
        BasicMessageChannel<dynamic>('dev.flutter.pigeon.Api.call', StandardMessageCodec());
    
    final Map<dynamic, dynamic> replyMap = await channel.send(requestMap);
    if (replyMap == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
        details: null);
    } else if (replyMap['error'] != null) {
      final Map<dynamic, dynamic> error = replyMap['error'];
      throw PlatformException(
          code: error['code'],
          message: error['message'],
          details: error['details']);
    } else {
      return WifiResponse._fromMap(replyMap['result']);
    }
    
  }
}

