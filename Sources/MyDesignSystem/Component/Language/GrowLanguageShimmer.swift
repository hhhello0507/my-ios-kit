import SwiftUI

public struct GrowLanguageShimmer: View {
    
    public init() {}
    
    public var body: some View {
        RowShimmer(width: 60, height: 34)
            .cornerRadius(100, corners: .allCorners)
    }
}
