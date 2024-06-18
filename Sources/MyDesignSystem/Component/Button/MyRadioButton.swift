import SwiftUI

public struct MyRadioButton: View {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let text: String
    private let selectedIcon: MyIconography
    private let unselectedIcon: MyIconography
    private let isSelected: Bool
    private let action: () -> Void
    
    public init(
        _ text: String,
        selectedIcon: MyIconography = .radio,
        unselectedIcon: MyIconography = .radioUnselected,
        isSelected: Bool,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.selectedIcon = selectedIcon
        self.unselectedIcon = unselectedIcon
        self.isSelected = isSelected
        self.action = action
    }
    
    public var body: some View {
        
        let primary: MyColorScheme = isSelected ? .radioButtonPrimary : .radioButtonPrimaryDisabled
        let secondary: MyColorScheme = isSelected ? .radioButtonSecondary : .radioButtonSecondaryDisabled
        
        Button {
            action()
            let impactMed = UIImpactFeedbackGenerator(style: .rigid)
            impactMed.impactOccurred()
        } label: {
            HStack(spacing: 6) {
                Image(icon: isSelected ? selectedIcon : unselectedIcon)
                    .resizable()
                    .myIconColor(primary)
                    .frame(size: 24)
                Text(text)
                    .myFont(.bodyM)
                    .myColor(secondary)
            }
            .padding(.horizontal, 14)
            .frame(height: 44)
            .stroke(12, content: colorProvider.color(primary), lineWidth: 1.5)
        }
        .applyAnimation()
    }
}
