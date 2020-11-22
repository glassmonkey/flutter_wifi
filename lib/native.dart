import 'package:flutter/material.dart';

import 'native/api.dart';

class WifiView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WifiViewState();
  }
}

class _WifiViewState extends State<WifiView> {
  String _wifiText;
  String _butteryText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._wifiText = "loading";
    this._butteryText = "loading";
    WifiCallbackApi.setup(WifiCallbackApiImpl(this.changeConnection));
    fetchWifi();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Text(_wifiText),
      Text(_butteryText),
      RaisedButton(
        child: Text('Get Buttery Information'),
        onPressed: fetchData,
      ),
    ]);
  }

  Future<void> fetchData() async {
    final api = BatteryApi();
    final req = BatteryRequest();
    req.unit = "%";
    final response = await api.call(req);

    setState(() {
      this._butteryText = response.responseMessage;
    });
  }

  Future<void> fetchWifi() async {
    final api = WifiApi();
    this.changeConnection(await api.call());
  }

  void changeConnection(WifiResponse response) {
    setState(() {
      if (response.availableWifi) {
        _wifiText = "WIFI";
      } else if (response.availableMobile) {
        _wifiText = "mobile";
      } else {
        _wifiText = "lost";
      }
    });
  }
}

class WifiCallbackApiImpl extends WifiCallbackApi {
  final Function(WifiResponse response) caller;

  WifiCallbackApiImpl(this.caller);

  @override
  void apply(WifiResponse response) {
    this.caller(response);
  }
}
