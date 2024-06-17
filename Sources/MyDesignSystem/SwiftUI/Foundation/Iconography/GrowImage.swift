import SwiftUI

public enum GrowImage {
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
