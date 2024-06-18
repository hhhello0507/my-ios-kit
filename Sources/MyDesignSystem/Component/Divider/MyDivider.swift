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
    private let color: MyColorScheme
    
    public init(
        type: DividerType = .thin,
        color: MyColorScheme = .dividerNormal
    ) {
        self.type = type
        self.color = color
    }
    
    public var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: type.height)
            .myColor(color)
    }
}
