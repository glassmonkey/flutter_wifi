//
//  ButteryApi.swift
//  Runner
//
//  Created by 永野峻輔 on 2020/11/22.
//

class ButteryApi: FlutterButteryApi {
    func add(_ input: FlutterButteryRequest, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FlutterButteryResponse? {
        let response = FlutterButteryResponse()
        let result = self.receiveBatteryLevel(unit: input.unit ?? "")
        response.responseMessage = result
        return response
    }
    
    private func receiveBatteryLevel(unit: String) -> String {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true
        if device.batteryState == UIDevice.BatteryState.unknown {
            return  "UNAVAILABLE: Battery info unavailable"
        }
        
        return String(Int(device.batteryLevel * 100)) + unit
    }
}
