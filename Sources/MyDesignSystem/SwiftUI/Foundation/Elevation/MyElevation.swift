import SwiftUI

public enum MyElevation {
    case evBlack1
    case evBlack2
    case evBlack3
    
    var color: Color {
        switch self {
        case .evBlack1: .init(0x000000, alpha: 0.02)
        case .evBlack2: .init(0x000000, alpha: 0.04)
        case .evBlack3: .init(0x000000, alpha: 0.06)
        }
    }
    
    var radius: CGFloat {
        switch self {
        case .evBlack1: 10
        case .evBlack2: 12
        case .evBlack3: 18
        }
    }
    
    var x: CGFloat {
        0
    }
    
    var y: CGFloat {
        switch self {
        case .evBlack1: 3
        case .evBlack2: 4
        case .evBlack3: 6
        }
    }
}
