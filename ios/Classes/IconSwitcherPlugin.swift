import Flutter
import UIKit

public class IconSwitcherPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "icon_switcher", binaryMessenger: registrar.messenger())
        let instance = IconSwitcherPlugin()
        
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        DispatchQueue.main.async {
            switch call.method {
            case "setAppIcon":
                guard
                    let arguments = call.arguments as? [String: String],
                    let iconName = arguments["iconName"]
                else { return }

                self.setAppIcon(iconName: iconName) { success in
                    result(success)
                }
            case "resetAppIcon":
                self.resetAppIcon() { success in
                    result(success)
                }
            case "getIconName":
                result(self.getIconName())
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }
}

private extension IconSwitcherPlugin {

    func setAppIcon(iconName: String, completionHandler: @escaping (Bool) -> Void) {
        guard UIApplication.shared.supportsAlternateIcons else { return completionHandler(false) }

        UIApplication.shared.setAlternateIconName(iconName) { error in
            DispatchQueue.main.async {
                completionHandler(error != nil)
            }
        }
    }

    func resetAppIcon(completionHandler: @escaping (Bool) -> Void) {
        guard UIApplication.shared.supportsAlternateIcons else { return }

        UIApplication.shared.setAlternateIconName(nil) { error in
            DispatchQueue.main.async {
                completionHandler(error != nil)
            }
        }
    }

    func getIconName() -> String {
        guard UIApplication.shared.supportsAlternateIcons else { return "default" }

        return UIApplication.shared.alternateIconName ?? "default"
    }
}
