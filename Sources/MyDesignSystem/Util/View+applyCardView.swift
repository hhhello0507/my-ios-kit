import SwiftUI

public extension View {
    func applyCardView() -> some View {
        self
            .myElevation(.evBlack1)
            .myBackground(.background)
            .cornerRadius(12, corners: .allCorners)
    }
}
