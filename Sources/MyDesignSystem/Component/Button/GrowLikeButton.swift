import SwiftUI

public struct GrowLikeButton: View {
    
    // MARK: - State
    @EnvironmentObject private var colorProvider: ColorProvider
    
    // MARK: - Parameters
    private let like: Int
    private let isLiked: Bool
    private let action: () async -> Void
    
    public init(
        like: Int,
        isLiked: Bool,
        action: @escaping () async -> Void
    ) {
        self.like = like
        self.isLiked = isLiked
        self.action = action
    }
    
    public var body: some View {
        
        let color: GrowColorScheme = isLiked ? .likePrimary : .likePrimaryDisabled
        let background: GrowColorScheme = isLiked ? .likeSecondary : .likeSecondaryDisabled
        
        Button {
            Task {
                await action()
            }
        } label: {
            HStack(spacing: 4) {
                Image(icon: .heart)
                    .resizable()
                    .growIconColor(color)
                    .frame(size: 24)
                Text("\(like)")
                    .growColor(color)
                    .growFont(.bodyB)
            }
            .padding(.horizontal, 6)
            .frame(height: 36)
            .growBackground(background)
            .cornerRadius(4, corners: .allCorners)
        }
    }
}
