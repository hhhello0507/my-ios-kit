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

public struct GrowDivider: View {
    
    private let type: DividerType
    private let color: GrowColorScheme
    
    public init(
        type: DividerType = .thin,
        color: GrowColorScheme = .dividerNormal
    ) {
        self.type = type
        self.color = color
    }
    
    public var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: type.height)
            .growColor(color)
    }
}
