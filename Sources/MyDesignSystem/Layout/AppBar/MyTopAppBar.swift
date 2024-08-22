//
//  InfinityTopBar.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/8/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public struct TopAppBarButton {
    
    public let icon: Iconable
    public let action: () -> Void
    
    public init(icon: Iconable, action: @escaping () -> Void) {
        self.icon = icon
        self.action = action
    }
}

public enum TopAppBarType {
    case `default`
    case small
}

@available(iOS 15.0, macOS 13.0, *)
public struct MyTopAppBar<C>: View where C: View {
    
    private let edgeInsets = EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15)
    
    @Environment(\.dismiss) private var dismiss
    
    private let title: String
    private let type: TopAppBarType
    private let background: Colorable
    private let buttons: [TopAppBarButton]
    private let content: (EdgeInsets) -> C
    
    public static func `default`(
        title: String,
        background: Colorable = Colors.Background.neutral,
        buttons: [TopAppBarButton] = [],
        @ViewBuilder content: @escaping (EdgeInsets) -> C
    ) -> Self {
        self.init(
            title: title,
            type: .default,
            background: background,
            buttons: buttons,
            content: content
        )
    }

    public static func small(
        title: String,
        background: Colorable = Colors.Background.neutral,
        buttons: [TopAppBarButton] = [],
        @ViewBuilder content: @escaping (EdgeInsets) -> C
    ) -> Self {
        self.init(
            title: title,
            type: .small,
            background: background,
            buttons: buttons,
            content: content
        )
    }

    public var body: some View {
        ZStack {
            // Background
            background.box.color
                .ignoresSafeArea()
            
            // Screen
            VStack(spacing: 0) {
                // Top app bar
                HStack(spacing: 0) {
                    if type == .small {
                        Button {
                            dismiss()
                        } label: {
                            Image(icon: Icons.Arrow.ExpandArrow)
                                .resizable()
                                .renderingMode(.template)
                                .foreground(Colors.Label.normal)
                                .frame(width: 24, height: 24)
                                .padding(12)
                        }
                    }
                    
                    if type == .default {
                        Spacer().frame(width: 8)
                    }
                    Text(title)
                        .myFont(type == .default ? .title1B : .headlineM)
                        .foreground(Colors.Label.normal)
                    Spacer()
                    ForEach(buttons.indices, id: \.self) {
                        makeButton(button: buttons[$0])
                    }
                }
                .frame(height: 54)
                .background(background)
                .padding(.horizontal, 4)
                content(edgeInsets)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    func makeButton(button: TopAppBarButton) -> some View {
        Button {
            button.action()
        } label: {
            Image(icon: button.icon)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foreground(Colors.Label.alternative)
                .opacity(0.5)
                .padding(12)
        }
    }
}

#Preview {
    MyTopAppBar.default(
        title: "제목",
        buttons: [
            .init(icon: Icons.Feature.Person) {
                
            }
        ]
    ) { _ in
        
    }
    .registerWanted()
}

#Preview {
    MyTopAppBar.small(title: "제목") { _ in
        
    }
    .registerWanted()
    .preferredColorScheme(.dark)
}
