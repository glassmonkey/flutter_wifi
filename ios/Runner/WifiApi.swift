//
//  WifiApi.swift
//  Runner
//
//  Created by 永野峻輔 on 2020/11/23.
//

import Foundation
import Reachability

class Api: FlutterApi {


    var isWifi = false
    var isMobile = false

    let reachability = try! Reachability()

    let callback = FlutterCallbackApi()

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
            print("update")
            print(reachability.connection)
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
            self.callback.apply(self.fetchStatus()) {
                _ in
                print("callback??")
            }
        }
        try! self.reachability.startNotifier()
    }

    func fetchStatus(_ isDetect: Bool = true) -> FlutterWifiResponse {
        let response = FlutterWifiResponse()
        response.availableMobile = isMobile as NSNumber
        response.availableWifi = isWifi as NSNumber
        response.availableDetect = isDetect as NSNumber
        return response
    }
}
