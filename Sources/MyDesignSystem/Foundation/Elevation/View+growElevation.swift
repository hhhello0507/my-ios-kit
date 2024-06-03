import SwiftUI

public extension View {
    func growElevation(_ ev: GrowElevation) -> some View {
        self
            .shadow(color: ev.color, radius: ev.radius, x: ev.x, y: ev.y)
    }
}
