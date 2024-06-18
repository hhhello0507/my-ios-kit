import SwiftUI

public extension Image {
    func myIconColor(_ color: MyColorScheme) -> some View {
        self
            .renderingMode(.template)
            .myColor(color)
    }
}
