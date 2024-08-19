import SwiftUI

public struct MyButton: View {
    
    // MARK: - State
    @State private var isLoading = false
    
    // MARK: - Parameters
    private let text: String
    private let type: ButtonType
    private let leadingIcon: MyIconography?
    private let trailingIcon: MyIconography?
    private let isEnabled: Bool
    private let isRounded: Bool
    private let action: () async -> Void
    
    public init(
        _ text: String,
        type: ButtonType,
        leadingIcon: MyIconography? = nil,
        trailingIcon: MyIconography? = nil,
        isEnabled: Bool = true,
        isRounded: Bool = false,
        action: @escaping () async -> Void
    ) {
        self.text = text
        self.type = type
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.isEnabled = isEnabled
        self.isRounded = isRounded
        self.action = action
    }
    
    public var body: some View {
        
        Button {
            guard isEnabled, !isLoading else { return }
            isLoading = true
            Task {
                await action()
                isLoading = false
            }
        } label: {
            HStack(spacing: type.labelSpacing) {
                if let leadingIcon {
                    Image(icon: leadingIcon)
                        .resizable()
//                        .myIconColor(color)
                        .frame(width: 20, height: 20)
                }
                Text(text)
//                    .myColor(color)
                    .myFont(type.font)
                    .opacity(isLoading ? 0 : 1)
                    .overlay {
                        if isLoading {
                            ProgressView()
//                                .progressViewStyle(CircularProgressViewStyle(tint: colorProvider.color(color)))
                        }
                    }
                if let trailingIcon {
                    Image(icon: trailingIcon)
                        .resizable()
//                        .myIconColor(color)
                        .frame(width: 20, height: 20)
                }
            }
            .padding(.horizontal, type.horizontalPadding)
        }
        .buttonStyle(MyButtonStyle(isLoading: isLoading, isEnabled: isEnabled, isRounded: isRounded, type: type))
        .disabled(isLoading)
    }
}

struct MyButtonStyle: ButtonStyle {
    private let isLoading: Bool
    private let isEnabled: Bool
    private let isRounded: Bool
    private let type: ButtonType
    
    init(
        isLoading: Bool,
        isEnabled: Bool,
        isRounded: Bool,
        type: ButtonType
    ) {
        self.isLoading = isLoading
        self.isEnabled = isEnabled
        self.isRounded = isRounded
        self.type = type
    }
    
    func makeBody(configuration: Configuration) -> some View {
        
//        let background: Sementic = isEnabled ? .buttonPrimary : .buttonPrimaryDisabled
        
        configuration.label
            .frame(height: type.height)
//            .if(type == .CTA) {
//                $0.frame(maxWidth: .infinity)
//            }
//            .myBackground(background)
            .cornerRadius(isRounded ? type.height / 2 : type.cornerRadius, corners: .allCorners)
//            .if(isEnabled) {
//                $0.addPressAnimation(configuration.isPressed)
//            }
    }
}

#Preview {
    VStack {
        MyButton("시작하기", type: .CTA) {}
        Text("Hello")
    }
    .registerWanted()
}
