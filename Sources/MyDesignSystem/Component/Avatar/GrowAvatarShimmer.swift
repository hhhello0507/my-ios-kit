import SwiftUI

public struct GrowAvatarShimmer: View {
    
    private let type: AvatarType
    
    public init(
        type: AvatarType
    ) {
        self.type = type
    }
    
    public var body: some View {
        Circle()
            .frame(size: type.size)
            .shimmer()
    }
}
