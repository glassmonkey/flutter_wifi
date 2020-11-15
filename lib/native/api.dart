import 'package:pigeon/pigeon.dart';

// 引数の定義
class Request {
  String unit;
}

// 戻り値の定義
class Response {
  String responseMessage;
}

@HostApi()
abstract class Api {
  Response add(Request req);
}

// 生成されるファイルの出力先などの設定
void configurePigeon(PigeonOptions opts) {
  opts.dartOut = 'lib/native/api_generated.dart';
  opts.javaOut = 'android/app/src/main/java/io/flutter/plugins/Pigeon.java';
  opts.javaOptions.package = "io.flutter.plugins";
  opts.objcHeaderOut = 'ios/Runner/Pigeon.h';
  opts.objcSourceOut = 'ios/Runner/Pigeon.m';
  opts.objcOptions.prefix = 'FLT';
}
