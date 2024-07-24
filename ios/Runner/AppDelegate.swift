import UIKit
import Flutter
import GoogleMaps
import flutter_background_service_ios

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    UIApplication.shared.setMinimumBackgroundFetchInterval(TimeInterval(60*15))
    SwiftFlutterBackgroundServicePlugin.taskIdentifier = "dev.flutter.background.refresh"
    GMSServices.provideAPIKey("AIzaSyDmTTd3yiTiyosQb_CYX2Ync20v-xiynYg")
    if #available(iOS 10.0, *) {
        UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
