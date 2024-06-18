import SwiftUI

public struct RowShimmer: View {
    
    private let width: CGFloat
    private let height: CGFloat
    
    public init(
        width: CGFloat,
        height: CGFloat = 20
    ) {
        self.width = width
        self.height = height
    }
    
    public var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .shimmer()
            .cornerRadius(10, corners: .allCorners)
    }
}
