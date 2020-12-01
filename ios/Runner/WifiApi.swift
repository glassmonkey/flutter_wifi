//
//  WifiApi.swift
//  Runner
//
//  Created by 永野峻輔 on 2020/11/23.
//

import Foundation
import Reachability

class Api: FlutterApi {
    
    init(_ flutterBinaryMessenger: FlutterBinaryMessenger) {
        self.callbackApi = FlutterCallbackApi(binaryMessenger: flutterBinaryMessenger)
    }


    var isWifi = false
    var isMobile = false
    
    let callbackApi: FlutterCallbackApi

    let reachability = try! Reachability()

    func call(_ input: FlutterWifiRequest, error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FlutterWifiResponse? {

        let isDetect = input.isDetect as! Bool

        if isDetect {
            subscribe()
        } else {
            self.reachability.stopNotifier()
        }
        return self.fetchStatus(isDetect)
    }



    func subscribe() {
        reachability.whenReachable = { reachability in
            switch reachability.connection {
            case .wifi:
                self.isWifi = true
                self.isMobile = false
            case .cellular:
                self.isWifi = false
                self.isMobile = true
            default:
                self.isWifi = false
                self.isMobile = false
            }
            DispatchQueue.main.async {
                self.callbackApi.apply(self.fetchStatus(), completion: { (error: Error?) -> Void in
                })
            }
        }
        try! self.reachability.startNotifier()
    }

    func fetchStatus(_ isDetect: Bool = true) -> FlutterWifiResponse {
        let response = FlutterWifiResponse()
        response.availableMobile = self.isMobile as NSNumber
        response.availableWifi = self.isWifi as NSNumber
        response.availableDetect = isDetect as NSNumber
        return response
    }
}
