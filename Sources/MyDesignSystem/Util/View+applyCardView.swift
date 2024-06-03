import SwiftUI

public extension View {
    func applyCardView() -> some View {
        self
            .growElevation(.evBlack1)
            .growBackground(.background)
            .cornerRadius(12, corners: .allCorners)
    }
}
