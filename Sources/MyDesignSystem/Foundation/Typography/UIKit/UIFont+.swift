#if canImport(UIKit)
import UIKit

public extension UIFont {
    static func wanted(_ weight: Wanted.Weight, size: CGFloat) -> UIFont {
        UIFont(name: "WantedSans-\(weight.rawValue)", size: size) ?? .systemFont(ofSize: size, weight: weight.weight)
    }
}

public extension MyFont {
    var uiFont: UIFont {
        switch self {
        case .title1B: .wanted(.Bold, size: 28)
        case .title1M: .wanted(.Medium, size: 28)
        case .title1R: .wanted(.Regular, size: 28)
        case .title2B: .wanted(.Bold, size: 24)
        case .title2M: .wanted(.Medium, size: 24)
        case .title2R: .wanted(.Regular, size: 24)
        case .headline1B: .wanted(.Bold, size: 20)
        case .headline1M: .wanted(.Medium, size: 20)
        case .headline1R: .wanted(.Regular, size: 20)
        case .headline2B: .wanted(.Bold, size: 18)
        case .headline2M: .wanted(.Medium, size: 18)
        case .headline2R: .wanted(.Regular, size: 18)
        case .bodyB: .wanted(.Bold, size: 16)
        case .bodyM: .wanted(.Medium, size: 16)
        case .bodyR: .wanted(.Regular, size: 16)
        case .labelB: .wanted(.Bold, size: 14)
        case .labelM: .wanted(.Medium, size: 14)
        case .labelR: .wanted(.Regular, size: 14)
        case .captionB: .wanted(.Bold, size: 12)
        case .captionM: .wanted(.Medium, size: 12)
        case .captionR: .wanted(.Regular, size: 12)
        }
    }
}
#endif
