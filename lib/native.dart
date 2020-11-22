import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wifi_sample/native/api.dart';

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
    final api = ButteryApi();
    final req = ButteryRequest()..unit = "ぱーせんと";
    final response = await api.add(req);

    setState(() {
      _batteryLevel = response.responseMessage;
    });
  }
}
