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
    
    func growColor(_ growColor: GrowColorScheme) -> some View {
        self
    }
}

public struct GrowColorViewModifier: ViewModifier {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let color: GrowColorScheme
    
    public init(
        color: GrowColorScheme
    ) {
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        content
            .foregroundStyle(colorProvider.isDarkTheme ? color.darkColor : color.lightColor)
    }
}


public struct GrowBackgroundViewModifier: ViewModifier {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let color: GrowColorScheme
    
    public init(
        color: GrowColorScheme
    ) {
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        content
            .background(colorProvider.isDarkTheme ? color.darkColor : color.lightColor)
    }
}

public struct GrowTintViewModifier: ViewModifier {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let color: GrowColorScheme
    
    public init(
        color: GrowColorScheme
    ) {
        self.color = color
    }
    
    public func body(content: Content) -> some View {
        content
            .tint(colorProvider.isDarkTheme ? color.darkColor : color.lightColor)
    }
}

public extension View {
    func growColor(_ color: GrowColorScheme) -> some View {
        self
            .modifier(GrowColorViewModifier(color: color))
    }
    
    func growBackground(_ color: GrowColorScheme) -> some View {
        self
            .modifier(GrowBackgroundViewModifier(color: color))
    }
    
    func growTint(_ color: GrowColorScheme) -> some View {
        self
            .modifier(GrowTintViewModifier(color: color))
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
    
    public func color(_ color: GrowColorScheme) -> Color {
        isDarkTheme ? color.darkColor : color.lightColor
    }
}
