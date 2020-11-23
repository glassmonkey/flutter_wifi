//
//  WifiApi.swift
//  Runner
//
//  Created by 永野峻輔 on 2020/11/23.
//

import Foundation
import Reachability

class WifiApi: FlutterWifiApi {
    
    var isWifi = false
    var isMobile = false
    
    let reachability = try! Reachability()
    
    func call(_ error: AutoreleasingUnsafeMutablePointer<FlutterError?>) -> FlutterWifiResponse? {
        return self.fetchStatus()
    }
    
    init() {
        
        let callback = FlutterWifiCallbackApi()
        
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
            callback.apply(self.fetchStatus()) {
                _ in
            }
        }
        
        reachability.whenUnreachable = { _ in
           callback.apply(self.fetchStatus()) {
                           _ in
                       }
        }
        
        try! self.reachability.startNotifier()
    }
    
    func fetchStatus() -> FlutterWifiResponse {
        let response = FlutterWifiResponse()
        response.availableMobile = isMobile as NSNumber
        response.availableWifi = isWifi as NSNumber
        return response
    }
}
