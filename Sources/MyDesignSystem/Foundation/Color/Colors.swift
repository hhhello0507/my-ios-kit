import SwiftUI

public protocol Colorable {
    var box: ColorBox { get }
}

public struct ColorBox {
    public let light: Color
    public let dark: Color
    public init(_ light: Color, _ dark: Color) {
        self.light = light
        self.dark = dark
    }
    
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

public enum Colors {
    public enum Label: Colorable, CaseIterable {
        case normal, strong, neutral, alternative, assistive, disable
        public var box: ColorBox {
            switch self {
            case .normal: ColorBox(Palette.neutral5, Palette.neutral99)
            case .strong: ColorBox(Palette.common100, Palette.common00)
            case .neutral: ColorBox(Palette.neutral25, Palette.neutral95)
            case .alternative: ColorBox(Palette.neutral40, Palette.neutral90)
            case .assistive: ColorBox(Palette.neutral50, Palette.neutral70)
            case .disable: ColorBox(Palette.neutral97, Palette.neutral30)
            }
        }
    }
    public enum Line: Colorable, CaseIterable {
        case normal, neutral, alternative
        public var box: ColorBox {
            switch self {
            case .normal: ColorBox(Palette.neutral90, Palette.neutral50)
            case .neutral: ColorBox(Palette.neutral95, Palette.neutral30)
            case .alternative: ColorBox(Palette.neutral97, Palette.neutral25)
            }
        }
    }
    public enum Fill: Colorable, CaseIterable {
        case normal, neutral, alternative, assistive
        public var box: ColorBox {
            switch self {
            case .normal: ColorBox(Palette.neutral97, Palette.neutral20)
            case .neutral: ColorBox(Palette.neutral95, Palette.neutral25)
            case .alternative: ColorBox(Palette.neutral90, Palette.neutral30)
            case .assistive: ColorBox(Palette.common00, Palette.neutral60)
            }
        }
    }
    public enum Background: Colorable, CaseIterable {
        case normal, neutral, alternative
        public var box: ColorBox {
            switch self {
            case .normal: ColorBox(Palette.common00, Palette.neutral15)
            case .neutral: ColorBox(Palette.neutral99, Palette.neutral10)
            case .alternative: ColorBox(Palette.neutral99, Palette.neutral7)
            }
        }
    }
    public enum Elevation: Colorable, CaseIterable {
        case black1, black2, black3
        public var box: ColorBox {
            switch self {
            case .black1: ColorBox(Color.black.opacity(0.02), Color(0xCCCCD6, opacity: 0.02))
            case .black2: ColorBox(Color.black.opacity(0.04), Color(0xCCCCD6, opacity: 0.04))
            case .black3: ColorBox(Color.black.opacity(0.06), Color(0xCCCCD6, opacity: 0.06))
            }
        }
    }
    public enum Static: Colorable, CaseIterable {
        case white, black, clear
        public var box: ColorBox {
            switch self {
            case .white: ColorBox(Palette.common00, Palette.common00)
            case .black: ColorBox(Palette.common100, Palette.common100)
            case .clear: ColorBox(.clear, .clear)
            }
        }
    }
    public enum Primary: Colorable, CaseIterable {
        case normal, alternative, assistive
        public var box: ColorBox {
            switch self {
            case .normal: ColorBox(CustomPalette.primary50, CustomPalette.primary50)
            case .alternative: ColorBox(CustomPalette.primary50.opacity(0.65), CustomPalette.primary50.opacity(0.65))
            case .assistive: ColorBox(CustomPalette.primary50.opacity(0.2), CustomPalette.primary50.opacity(0.2))
            }
        }
    }
}

private struct ColorsPreview: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(Colors.Label.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
                ForEach(Colors.Line.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
                ForEach(Colors.Fill.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
                ForEach(Colors.Background.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
                ForEach(Colors.Elevation.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
                ForEach(Colors.Static.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
                ForEach(Colors.Primary.allCases, id: \.self) {
                    $0.box.color.frame(height: 30)
                }
            }
        }
    }
}

#Preview {
    ColorsPreview()
}

#Preview {
    ColorsPreview()
        .preferredColorScheme(.dark)
}
