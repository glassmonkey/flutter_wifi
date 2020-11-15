import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WifiView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WifiViewState();
  }
}

class _WifiViewState extends State<WifiView> {
  MethodChannel _platform;

  String _batteryLevel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._platform =
        MethodChannel('nagano.shunsuke.flutter_wifi_sample/battery');
    this._batteryLevel = "loading";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Text(_batteryLevel),
      RaisedButton(
        child: Text('Get Battery Level'),
        onPressed: fetchData,
      ),
    ]);
  }

  Future<void> fetchData() async {
    try {
      final int result = await _platform.invokeMethod('getBatteryLevel');
      _batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      _batteryLevel = "Failed to get battery level: '${e.message}'.";
    }
    setState(() {});
  }
}