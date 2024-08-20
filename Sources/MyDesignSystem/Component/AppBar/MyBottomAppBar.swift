import SwiftUI

public protocol BottomAppBarItem: Equatable {
    var icon: Iconable { get }
    var text: String { get }
}

@available(iOS 13.0, macOS 12.0, *)
public struct MyBottomAppBar<C, Item>: View where C: View, Item: BottomAppBarItem {
    
    private let data: [Item]
    private let selection: Item
    private let onTap: (Item) -> Void
    private let content: () -> C
    
    public init(
        _ data: [Item],
        selection: Item,
        onTap: @escaping (Item) -> Void,
        @ViewBuilder content: @escaping () -> C
    ) {
        self.data = data
        self.selection = selection
        self.onTap = onTap
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            content()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack(spacing: 0) {
                Spacer()
                bottomBarBar
            }
            .ignoresSafeArea()
        }
    }
    
    #if canImport(UIKit)
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    #endif
    
    @ViewBuilder
    private var bottomBarBar: some View {
        HStack(spacing: 0) {
            ForEach(data.indices, id: \.self) { idx in
                let tab = data[idx]
                Button {
                    if selection != tab {
                        onTap(tab)
                    }
                } label: {
                    MyBottomAppBarItem(type: tab, isSelected: selection == tab)
                        .frame(maxWidth: .infinity)
                        .background(Colors.Background.neutral)
                }
                .applyAnimation()
            }
        }
        #if canImport(UIKit)
        .padding(.bottom, safeAreaInsets.bottom)
        .onChange(of: selection) { _ in
            let impactMed = UIImpactFeedbackGenerator(style: .rigid)
            impactMed.impactOccurred()
        }
        #endif
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .background(Colors.Background.neutral)
        .stroke(0, content: Colors.Line.alternative.box.color)
        .padding(.horizontal, -1)
        .padding(.bottom, -1)
    }
}

struct Item: BottomAppBarItem {
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }
    
    var id: Int
    var icon: Iconable
    var text: String
}

private struct BottomAppBarPreview: View {
    
    private let data = [
        Item(id: 1, icon: Icons.ETC.Blank, text: "Tab"),
        Item(id: 2, icon: Icons.ETC.Blank, text: "Tab"),
        Item(id: 3, icon: Icons.ETC.Blank, text: "Tab"),
        Item(id: 4, icon: Icons.ETC.Blank, text: "Tab"),
        Item(id: 5, icon: Icons.ETC.Blank, text: "Tab")
    ]
    
    @State private var selection = Item(id: 1, icon: Icons.Feature.Home, text: "홈")
    
    var body: some View {
        MyBottomAppBar(data, selection: selection) { item in
            selection = item
        } content: {
            EmptyView()
        }
    }
}

#Preview {
    BottomAppBarPreview()
}

#Preview {
    BottomAppBarPreview()
        .preferredColorScheme(.dark)
}
