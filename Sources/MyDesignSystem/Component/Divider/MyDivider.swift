import SwiftUI

public enum DividerType {
    case thin
    case thick
    
    var height: CGFloat {
        switch self {
        case .thin: 1
        case .thick: 8
        }
    }
}

public struct MyDivider: View {
    
    private let type: DividerType
    
    public init(
        type: DividerType = .thin
    ) {
        self.type = type
    }
    
    public var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: type.height)
//            .myColor(color)
    }
}
