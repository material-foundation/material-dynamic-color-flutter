import Cocoa
import FlutterMacOS

public class DynamicColorPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "io.material.plugins/dynamic_color", binaryMessenger: registrar.messenger)
    let instance = DynamicColorPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getControlAccentColor":
      var nsColor = NSColor.systemBlue
      if #available(macOS 10.14, *) {
        nsColor = NSColor.controlAccentColor
      }
      var r: CGFloat = 0
      var g: CGFloat = 0
      var b: CGFloat = 0
      var a: CGFloat = 0
      nsColor.usingColorSpace(.sRGB)!.getRed(&r, green: &g, blue: &b, alpha: &a)
      result(Int(a * 255) << 24 + Int(r * 255) << 16 + Int(g * 255) << 8 + Int(b * 255))
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
