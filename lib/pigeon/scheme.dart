import 'package:pigeon/pigeon.dart';

class WifiRequest {
  bool isDetect;
}

// 戻り値の定義
class WifiResponse {
  bool availableDetect;
  bool availableWifi;
  bool availableMobile;
}

@HostApi()
abstract class Api {
  WifiResponse call(WifiRequest request);
}

@FlutterApi()
abstract class CallbackApi {
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
