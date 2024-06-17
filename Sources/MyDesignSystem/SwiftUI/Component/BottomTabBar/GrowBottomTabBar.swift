import SwiftUI

public struct GrowBottomTabBar<C>: View where C: View {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    private let selectedTab: BottomTabType
    private let onTap: (BottomTabType) -> Void
    private let content: () -> C
    
    public init(
        selectedTab: BottomTabType,
        onTap: @escaping (BottomTabType) -> Void,
        content: @escaping () -> C
    ) {
        self.selectedTab = selectedTab
        self.onTap = onTap
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            content()
            bottomBarBar
                .toBottom()
                .ignoresSafeArea()
        }
    }
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    @ViewBuilder
    private var bottomBarBar: some View {
        HStack(spacing: 0) {
            Spacer()
            ForEach(BottomTabType.allCases, id: \.self) { tab in
                Button {
                    if selectedTab != tab {
                        onTap(tab)
                    }
                } label: {
                    GrowBottomTabItem(type: tab, isSelected: selectedTab == tab)
                }
                .applyAnimation()
            }
            Spacer()
        }
        .padding(.bottom, safeAreaInsets.bottom)
        .padding(.vertical, 8)
        .padding(.horizontal, 8)
        .growBackground(.background)
        .cornerRadius(16, corners: [.topLeft, .topRight])
        .stroke(16, corners: [.topLeft, .topRight], content: colorProvider.color(.bottomTabSecondary))
        .onChange(of: selectedTab) { _ in
            let impactMed = UIImpactFeedbackGenerator(style: .rigid)
            impactMed.impactOccurred()
        }
    }
}
