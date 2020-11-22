import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController

        FlutterButteryApiSetup(controller.binaryMessenger, ButteryApi())

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}


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
