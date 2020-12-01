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

  bool _isSwitch;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _wifiText = "loading";
    _isSwitch = false;
    CallbackApi.setup(CallbackApiImpl(this.changeConnection));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      Text(_wifiText),
      RaisedButton(
        child: Text("Get Wifi Information"),
        onPressed: fetchData,
        color: _isSwitch ? Colors.green : Colors.black12,
        textColor: Colors.white,
      ),
    ]);
  }

  Future<void> fetchData() async {
    setState(() {
      _isSwitch = !_isSwitch;
    });
    final api = Api();
    final request = WifiRequest();
    request.isDetect = _isSwitch;
    this.changeConnection(await api.call(request));
  }

  void changeConnection(WifiResponse response) {
    setState(() {
      if (!response.availableDetect) {
        _wifiText = "Stop Detection";
        return;
      }

      if (response.availableWifi) {
        _wifiText = "WIFI Connection";
      } else if (response.availableMobile) {
        _wifiText = "Mobile Connection";
      } else {
        _wifiText = "Lost Connection";
      }
    });
  }
}

class CallbackApiImpl extends CallbackApi {
  final Function(WifiResponse response) caller;

  CallbackApiImpl(this.caller);

  @override
  void apply(WifiResponse response) {
    print(response);
    this.caller(response);
  }
}
