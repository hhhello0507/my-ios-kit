import SwiftUI
import NukeUI

public enum AvatarType: CaseIterable {
    case extraSmall
    case small
    case medium
    case large
    case extraLarge
    case xxl
    
    var size: CGFloat {
        switch self {
        case .extraSmall: 16
        case .small: 24
        case .medium: 32
        case .large: 36
        case .extraLarge: 64
        case .xxl: 128
        }
    }
}

public struct MyAvatar: View {
    
    private let url: String?
    private let type: AvatarType
    
    public init(
        _ url: String? = nil,
        type: AvatarType
    ) {
        self.url = url
        self.type = type
    }
    
    public var body: some View {
        if let url {
            LazyImage(url: .init(string: url)) { state in
                if let image = state.image {
                   image
               } else if state.error != nil {
                   label
               } else {
//                   MyAvatarShimmer(type: type)
               }
            }
            .processors([.resize(size: .init(width: type.size, height: type.size), unit: .pixels)])
            .clipShape(Circle())
        } else {
            label
        }
    }
    
    @ViewBuilder
    private var label: some View {
        Circle()
//            .myColor(.avatarBackground)
            .frame(width: type.size, height: type.size)
            .overlay {
                Image(icon: .person)
                    .resizable()
//                    .myIconColor(.avatarLabel)
                    .frame(width: type.size / 2, height: type.size / 2)
            }
    }
}

#Preview {
    MyAvatar(type: .extraLarge)
        .registerWanted()
}
