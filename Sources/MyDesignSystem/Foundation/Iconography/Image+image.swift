import SwiftUI

public extension Image {
    init(image: MyImage) {
        self = Image(image.image, bundle: .module)
    }
}
