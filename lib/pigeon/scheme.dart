import 'package:pigeon/pigeon.dart';

// 引数の定義
class ButteryRequest {
  String unit;
}

// 戻り値の定義
class ButteryResponse {
  String responseMessage;
}

@HostApi()
abstract class ButteryApi {
  ButteryResponse add(ButteryRequest req);
}

// 引数の定義
class WifiRequest {
  String unit;
}

// 戻り値の定義
class WifiResponse {
  String responseMessage;
}

@HostApi()
abstract class WifiApi {
  WifiResponse call(WifiRequest req);
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
