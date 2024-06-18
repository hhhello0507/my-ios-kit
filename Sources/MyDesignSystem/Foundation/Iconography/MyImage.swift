import SwiftUI

public enum MyImage {
    case firstMedal
    case secondMedal
    case thirdMedal
    
    var image: String {
        switch self {
        case .firstMedal: "FirstMedal"
        case .secondMedal: "SecondMedal"
        case .thirdMedal: "ThirdMedal"
        }
    }
}
