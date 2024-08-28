#if canImport(UIKit)
import SwiftUI
import UIKIt

public extension ColorBox {
    public var color: Color {
        Color(UIColor {
            if $0.userInterfaceStyle == .dark {
                UIColor(dark)
            } else {
                UIColor(light)
            }
        })
    }
}
#endif
