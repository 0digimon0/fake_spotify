import UIKit
import Flutter
import Photos

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    // start add
    private var flutterResult: FlutterResult? = nil
    private var fetchLimit: Int = 0
    private var fetchResult: PHFetchResult<PHAsset>? = nil
    // end
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      //start add
      let controller = (window?.rootViewController as! FlutterViewController)
      let methodChannel =
          FlutterMethodChannel(name: "com.spotify.channel", binaryMessenger: controller.binaryMessenger)
      methodChannel
          .setMethodCallHandler({ [weak self](call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          switch call.method {
          case "getPhotos":
              var i = 1
//              self?.fetchLimit = call.arguments as! Int
//              self?.flutterResult = result
//              self?.getPhotos()
          case "fetchImage":
              self?.fetchImage(args: call.arguments as? Dictionary<String, Any>, result: result)
          default:
              result(FlutterMethodNotImplemented)
          }
      })
      // end
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func getPhotos() {
        PHPhotoLibrary.requestAuthorization { (status) in
            if (status == .authorized) {
                let options = PHFetchOptions()
                options.fetchLimit = self.fetchLimit
                options.sortDescriptors =
                    [NSSortDescriptor(key: "creationDate", ascending: false)]
                self.fetchResult = PHAsset.fetchAssets(with: .image, options: options)

                var results: [String] = []
                self.fetchResult?.enumerateObjects { asset, count, stop in
                    results.append(asset.localIdentifier)
                }
                self.flutterResult?(results)
            } else {
                let error =
                    FlutterError
                    .init(code: "0", message: "Not authorized", details: status)
                self.flutterResult?(error)
            }
        }
    }
    
    private func fetchImage(args: Dictionary<String, Any>?, result: @escaping FlutterResult) {
        // 1
        let id = args?["id"] as! String
        let width = args?["width"] as! Double
        let height = args?["height"] as! Double

        // 2
        self.fetchResult?.enumerateObjects { (asset: PHAsset, count: Int, stop: UnsafeMutablePointer<ObjCBool>) in
            if (asset.localIdentifier == id) {
                // 3
                stop.pointee = true
                // 4
                self.requestImage(width: width, height: height, asset: asset) { data in
                    // 5
                    result(data)
                }
                return
            }
        }

    }
    
    private func requestImage(width: Double, height: Double, asset: PHAsset, onComplete: @escaping (Data) -> Void) {
        let size = CGSize.init(width: width, height: height)
        let option = PHImageRequestOptions()
        option.isSynchronous = true
        PHImageManager
            .default()
            .requestImage(for: asset, targetSize: size, contentMode: .default, options: option) { image, _ in
                guard let image = image,
                      let data = image.jpegData(compressionQuality: 1.0) else { return }
                onComplete(data)
            }
    }
}
