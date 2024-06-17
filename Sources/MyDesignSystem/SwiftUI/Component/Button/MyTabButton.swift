import SwiftUI

public struct MyTabButton: View {
    
    // MARK: - State
    @EnvironmentObject private var colorProvider: ColorProvider
    
    // MARK: - Parameters
    private let text: String
    private let leadingIcon: MyIconography?
    private let trailingIcon: MyIconography?
    private let isSelected: Bool
    private let action: () async -> Void
    
    public init(
        _ text: String,
        leadingIcon: MyIconography? = nil,
        trailingIcon: MyIconography? = nil,
        isSelected: Bool,
        action: @escaping () async -> Void
    ) {
        self.text = text
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.isSelected = isSelected
        self.action = action
    }
    
    public var body: some View {
        
        let color: MyColorScheme = isSelected ? .tabButtonPrimary : .buttonTextDisabled
        
        Button {
            Task {
                await action()
            }
        } label: {
            HStack(spacing: 3) {
                if let leadingIcon {
                    Image(icon: leadingIcon)
                        .resizable()
                        .myIconColor(color)
                        .frame(size: 20)
                }
                Text(text)
                    .myColor(color)
                    .myFont(.bodyM)
                if let trailingIcon {
                    Image(icon: trailingIcon)
                        .resizable()
                        .myIconColor(color)
                        .frame(size: 20)
                }
            }
            .padding(.horizontal, 12)
        }
        .frame(height: 37)
        .overlay {
            Rectangle()
                .frame(height: 1)
                .myColor(color)
                .opacity(isSelected ? 1 : 0)
                .frame(maxWidth: .infinity)
                .toBottom()
        }
    }
}
