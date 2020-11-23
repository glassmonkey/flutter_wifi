//
//  ButteryApi.swift
//  Runner
//
//  Created by 永野峻輔 on 2020/11/22.
//

class BatteryApi: FlutterBatteryApi {
    func call(_ input: FlutterBatteryRequest, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FlutterBatteryResponse? {
        let response = FlutterBatteryResponse()
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
