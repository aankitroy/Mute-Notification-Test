import Flutter
import UIKit
import AVFoundation
import MediaPlayer
import AudioToolbox

@main
@objc class AppDelegate: FlutterAppDelegate {
   
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     
    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(name: "notification_sound_channel", binaryMessenger: controller.binaryMessenger)
     
    channel.setMethodCallHandler { (call, result) in
      if call.method == "reduceNotificationSound" {
        self.reduceNotificationSoundAndVibration()
        result(nil)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
     
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
   
  private func reduceNotificationSoundAndVibration() {
    
    DispatchQueue.main.async {
      let volumeView = MPVolumeView()
      if let volumeSlider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider {
        volumeSlider.value = 0.0
      }
    }
  }
}