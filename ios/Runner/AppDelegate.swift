import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey('AIzaSyCz4RQNg5nXP4uxtxkHI40GLpopB-dwWCk')
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
