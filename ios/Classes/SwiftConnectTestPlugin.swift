import Flutter
import UIKit
import IBMMobileFirstPlatformFoundation

public class SwiftConnectTestPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "connect_test", binaryMessenger: registrar.messenger())
    let instance = SwiftConnectTestPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {

    let args = call.arguments as? [String: Any]
    let scope = args?["scope"] as? String
    WLAuthorizationManager.sharedInstance()?.obtainAccessToken(forScope: scope, withCompletionHandler: { (token, error) -> Void in
      if error != nil {
          result(FlutterError(code: "ERR_ACCESSTOKEN", message: error?.localizedDescription, details: error.debugDescription))
      } else {
          // Token is of AccessToken class -> converting it to a dictionary so that it can accessed as a MAP/Object in the dart layer.
          let dictionary = NSMutableDictionary()
          dictionary.setValue(token?.value, forKey: Arguments.VALUE)
          dictionary.setValue(token?.asAuthorizationRequestHeaderField, forKey: Arguments.AS_AUTHORIZATION_REQUEST_HEADER)
          dictionary.setValue(token?.asFormEncodedBodyParameter, forKey: Arguments.AS_FORMENCODED_BODY_PARAMETER)
          dictionary.setValue(token?.scope, forKey: Arguments.SCOPE)
          result(dictionary)
      }
    })
  }

  private enum Arguments{
        public static var SCOPE: String = "scope"
        public static var ACCESSTOKEN: String = "accessToken"
        public static var VALUE: String = "value"
        public static var AS_AUTHORIZATION_REQUEST_HEADER: String = "asAuthorizationRequestHeader"
        public static var AS_FORMENCODED_BODY_PARAMETER: String = "asFormEncodedBodyParameter"
        public static var SECURITYCHECK: String = "securityCheck"
        public static var CREDENTIALS: String = "credentials"
        public static var TIMEOUT: String = "timeOut"
    }
}
