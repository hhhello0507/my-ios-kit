import SwiftUI

struct MyBottomAppBarItem<Item>: View where Item: BottomAppBarItem {
    
    private let type: Item
    private let isSelected: Bool
    
    init(
        type: Item,
        isSelected: Bool
    ) {
        self.type = type
        self.isSelected = isSelected
    }
    
    var body: some View {
        let color: Colorable = isSelected ? Sementic.Primary.normal : Sementic.Line.normal
        HStack {
            Spacer()
            VStack(spacing: 0) {
                Image(icon: type.icon)
                    .resizable()
                    .renderingMode(.template)
                    .foreground(color)
                    .frame(width: 28, height: 28)
                Text(type.text)
                    .font(.wanted(.Regular, size: 10))
                    .foreground(color)
            }
            .padding(.vertical, 4)
            Spacer()
        }
    }
}
