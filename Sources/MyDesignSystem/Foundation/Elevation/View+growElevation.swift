import SwiftUI

public extension View {
    func myElevation(_ ev: MyElevation) -> some View {
        self
            .shadow(color: ev.color, radius: ev.radius, x: ev.x, y: ev.y)
    }
}
