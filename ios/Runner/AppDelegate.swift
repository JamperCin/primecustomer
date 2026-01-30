import UIKit
import Flutter
import Firebase
//import GoogleMaps
import flutter_local_notifications

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        }
        
        FirebaseApp.configure() //add this before the code below
        //GMSServices.provideAPIKey("AIzaSyBsnVLVZOQYt7P1IJKKZ_nAoBjlMn5wgjw")
        GeneratedPluginRegistrant.register(with: self)
        
        //Register Local Notification here
        FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
            GeneratedPluginRegistrant.register(with: registry)
          }
        
        let shareChannelName = "channel:me.prime.share/share";
        let controller:FlutterViewController = self.window?.rootViewController as! FlutterViewController;
        let shareChannel:FlutterMethodChannel = FlutterMethodChannel.init(name: shareChannelName, binaryMessenger: controller as! FlutterBinaryMessenger);
        
        shareChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
            if (call.method == "shareFile") {
                self.shareFile(sharedItems: call.arguments!,controller: controller);
            }

            if (call.method == "showPrint") {
                self.showPrint(item:  call.arguments!);
            }
        });
        
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func shareFile(sharedItems:Any, controller:UIViewController) {
        let filePath:NSMutableString = NSMutableString.init(string: sharedItems as! String);
        let docsPath:NSString = (NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]) as NSString;
        let imagePath = docsPath.appendingPathComponent(filePath as String);
        let imageUrl = URL.init(fileURLWithPath: imagePath, relativeTo: nil);
        print("Image URL \(imageUrl)");
        do {
            let imageData = try Data.init(contentsOf: imageUrl);
            let shareImage = UIImage.init(data: imageData);
            
            let tableViewController = UIActivityViewController.init(activityItems: [shareImage!], applicationActivities: nil);
            tableViewController.modalPresentationStyle = UIModalPresentationStyle.popover
            //tableViewController.preferredContentSize = CGSize(width: 400, height: 400)
            controller.view.translatesAutoresizingMaskIntoConstraints = false;
            
            
            let popoverPresentationController = tableViewController.popoverPresentationController
            popoverPresentationController?.sourceView = controller.view
            popoverPresentationController?.sourceRect = CGRect(x: 0, y: 0, width: controller.view.frame.size.width/2, height: controller.view.frame.size.height/2)
            controller.present(tableViewController, animated: true, completion: nil)
            
        } catch let error {
            print(error.localizedDescription);
        }
    }
    
    func showPrint(item : Any){
        print("PRINTING \(item)");
    }
    
}
