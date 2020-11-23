import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let controller: FlutterViewController = window?.rootViewController as! FlutterViewController

        FlutterBatteryApiSetup(controller.binaryMessenger, BatteryApi())
        FlutterWifiApiSetup(controller.binaryMessenger, WifiApi())

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
