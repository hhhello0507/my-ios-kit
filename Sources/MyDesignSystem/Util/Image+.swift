import SwiftUI

public extension Image {
    func growIconColor(_ color: GrowColorScheme) -> some View {
        self
            .renderingMode(.template)
            .growColor(color)
    }
}
