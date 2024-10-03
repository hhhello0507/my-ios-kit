#if canImport(UIKit)
import UIKit

public enum UIApplicationUtil {
    public static var scenes: Set<UIScene> {
        return UIApplication.shared.connectedScenes
    }
    
    public static var windowScene: UIWindowScene? {
        return Self.scenes.compactMap({ $0 as? UIWindowScene }).first
    }
    
    public static var window: UIWindow? {
        return Self.windowScene?.windows.first
    }
    
    public static var safeAreaInsets: UIEdgeInsets? {
        Self.window?.safeAreaInsets
    }
}
#endif
