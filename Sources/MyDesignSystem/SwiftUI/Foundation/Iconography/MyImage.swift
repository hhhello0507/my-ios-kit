import SwiftUI

public enum MyImage {
    case firstMedal
    case secondMedal
    case thirdMedal
    
    var image: String {
        switch self {
        case .firstMedal: "firstMedal"
        case .secondMedal: "secondMedal"
        case .thirdMedal: "thirdMedal"
        }
    }
}
