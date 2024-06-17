import SwiftUI

public extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

public struct MyColorViewModifier: ViewModifier {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let color: MyColorScheme
    
    public init(
        color: MyColorScheme
    ) {
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        content
            .foregroundStyle(colorProvider.isDarkTheme ? color.darkColor : color.lightColor)
    }
}


public struct MyBackgroundViewModifier: ViewModifier {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let color: MyColorScheme
    
    public init(
        color: MyColorScheme
    ) {
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        content
            .background(colorProvider.isDarkTheme ? color.darkColor : color.lightColor)
    }
}

public struct MyTintViewModifier: ViewModifier {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let color: MyColorScheme
    
    public init(
        color: MyColorScheme
    ) {
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        content
            .tint(colorProvider.isDarkTheme ? color.darkColor : color.lightColor)
    }
}

public extension View {
    func myColor(_ color: MyColorScheme) -> some View {
        self
            .modifier(MyColorViewModifier(color: color))
    }
    
    func myBackground(_ color: MyColorScheme) -> some View {
        self
            .modifier(MyBackgroundViewModifier(color: color))
    }
    
    func myTint(_ color: MyColorScheme) -> some View {
        self
            .modifier(MyTintViewModifier(color: color))
    }
}

public class ColorProvider: ObservableObject {
    
    @Published public var isDarkTheme: Bool {
        didSet {
            UserDefaults.standard.setValue(isDarkTheme, forKey: "isDarkTheme")
        }
    }
    
    public init(isDarkTheme: Bool) {
        self.isDarkTheme = isDarkTheme
    }
    
    public func color(_ color: MyColorScheme) -> Color {
        isDarkTheme ? color.darkColor : color.lightColor
    }
}
