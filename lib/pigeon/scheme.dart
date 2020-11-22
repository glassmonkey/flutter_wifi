import 'package:pigeon/pigeon.dart';

// 引数の定義
class BatteryRequest {
  String unit;
}

// 戻り値の定義
class BatteryResponse {
  String responseMessage;
}

@HostApi()
abstract class BatteryApi {
  BatteryResponse call(BatteryRequest req);
}

// 戻り値の定義
class WifiResponse {
  bool availableWifi;
  bool availableMobile;
}

@HostApi()
abstract class WifiApi {
  WifiResponse call();
}

@FlutterApi()
abstract class WifiCallbackApi {
  void apply(WifiResponse response);
}

// 生成されるファイルの出力先などの設定
void configurePigeon(PigeonOptions opts) {
  opts.dartOut = 'lib/native/api.dart';
  opts.javaOut =
      'android/app/src/main/java/nagano/shunsuke/plugins/Pigeon.java';
  opts.javaOptions.package = "nagano.shunsuke.plugins";
  opts.objcHeaderOut = 'ios/Runner/Pigeon.h';
  opts.objcSourceOut = 'ios/Runner/Pigeon.m';
  opts.objcOptions.prefix = 'Flutter';
  //nnbdしたいときはこれをONにする
  //opts.dartOptions.isNullSafe = true;
}
