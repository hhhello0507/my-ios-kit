import SwiftUI

public enum ButtonType: CaseIterable {
    case CTA
    case Large
    case Medium
    case Small
    
    var horizontalPadding: CGFloat {
        switch self {
        case .CTA: 0
        case .Large: 20
        case .Medium: 12
        case .Small: 10
        }
    }
    
    var labelSpacing: CGFloat {
        switch self {
        case .CTA: 6
        case .Large: 5
        case .Medium: 4
        case .Small: 3
        }
    }
    
    var height: CGFloat {
        switch self {
        case .CTA: 56
        case .Large: 45
        case .Medium: 41
        case .Small: 37
        }
    }
    
    var font: MyFont {
        switch self {
        case .CTA: .bodyB
        case .Large: .bodyB
        case .Medium: .bodyB
        case .Small: .bodyR
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .CTA: 12
        case .Large: 10
        case .Medium: 8
        case .Small: 6
        }
    }
}
