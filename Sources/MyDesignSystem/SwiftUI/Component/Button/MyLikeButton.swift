import SwiftUI

public struct MyLikeButton: View {
    
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
        
        let color: MyColorScheme = isLiked ? .likePrimary : .likePrimaryDisabled
        let background: MyColorScheme = isLiked ? .likeSecondary : .likeSecondaryDisabled
        
        Button {
            Task {
                await action()
            }
        } label: {
            HStack(spacing: 4) {
                Image(icon: .heart)
                    .resizable()
                    .myIconColor(color)
                    .frame(size: 24)
                Text("\(like)")
                    .myColor(color)
                    .myFont(.bodyB)
            }
            .padding(.horizontal, 6)
            .frame(height: 36)
            .myBackground(background)
            .cornerRadius(4, corners: .allCorners)
        }
    }
}
