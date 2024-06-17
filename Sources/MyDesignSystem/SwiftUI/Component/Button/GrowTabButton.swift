import SwiftUI

public struct GrowTabButton: View {
    
    // MARK: - State
    @EnvironmentObject private var colorProvider: ColorProvider
    
    // MARK: - Parameters
    private let text: String
    private let leadingIcon: GrowIconography?
    private let trailingIcon: GrowIconography?
    private let isSelected: Bool
    private let action: () async -> Void
    
    public init(
        _ text: String,
        leadingIcon: GrowIconography? = nil,
        trailingIcon: GrowIconography? = nil,
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
        
        let color: GrowColorScheme = isSelected ? .tabButtonPrimary : .buttonTextDisabled
        
        Button {
            Task {
                await action()
            }
        } label: {
            HStack(spacing: 3) {
                if let leadingIcon {
                    Image(icon: leadingIcon)
                        .resizable()
                        .growIconColor(color)
                        .frame(size: 20)
                }
                Text(text)
                    .growColor(color)
                    .growFont(.bodyM)
                if let trailingIcon {
                    Image(icon: trailingIcon)
                        .resizable()
                        .growIconColor(color)
                        .frame(size: 20)
                }
            }
            .padding(.horizontal, 12)
        }
        .frame(height: 37)
        .overlay {
            Rectangle()
                .frame(height: 1)
                .growColor(color)
                .opacity(isSelected ? 1 : 0)
                .frame(maxWidth: .infinity)
                .toBottom()
        }
    }
}
