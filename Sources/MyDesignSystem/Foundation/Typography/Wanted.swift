import SwiftUI
import UIKit

public struct Wanted {
    
    public enum Weight: String, CaseIterable {
        case Black
        case Bold
        case ExtraBlack
        case ExtraBold
        case Medium
        case Regular
        case SemiBold
        
        var weight: UIFont.Weight {
            switch self {
            case .Black: .black
            case .Bold: .bold
            case .ExtraBlack: .black
            case .ExtraBold: .heavy
            case .Medium: .medium
            case .Regular: .regular
            case .SemiBold: .semibold
            }
        }
    }
    
    public static func register() {
        Wanted.Weight.allCases.forEach {
            guard let fontURL = Bundle.module.url(
                forResource: "WantedSans-\($0.rawValue)",
                withExtension: "otf"
            ),
                  let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
                  let font = CGFont(fontDataProvider) else { return }
            var error: Unmanaged<CFError>?
            CTFontManagerRegisterGraphicsFont(font, &error)
        }
    }
}
