import SwiftUI

struct MyBottomTabItem: View {
    
    let type: BottomTabType
    let isSelected: Bool
    
    init(
        type: BottomTabType,
        isSelected: Bool
    ) {
        self.type = type
        self.isSelected = isSelected
    }
    
    var body: some View {
        let color: MyColorScheme = isSelected ? .bottomTabPrimary : .bottomTabPrimaryDisabled
        HStack {
            Spacer()
            VStack(spacing: 0) {
                Image(type.image)
                    .resizable()
                    .myIconColor(color)
                    .frame(width: 28, height: 28)
                Text(type.label)
                    .font(.wanted(.Regular, size: 10))
                    .myColor(color)
            }
            .padding(.vertical, 4)
            Spacer()
        }
    }
}
