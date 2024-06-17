import SwiftUI

public extension Image {
    init(icon: MyIconography) {
        self = Image(icon.icon, bundle: .module)
    }
}
