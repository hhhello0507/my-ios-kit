//
//  Font+.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 4/7/24.
//  Copyright © 2024 molohala. All rights reserved.
//

import SwiftUI

public extension Font {
    static func wanted(_ weight: Wanted.Weight, size: CGFloat) -> Font {
        Font.custom("WantedSans-\(weight.rawValue)", size: size)
    }
}

public enum MyFont: CaseIterable {
    case title1B
    case title1M
    case title1R
    
    case title2B
    case title2M
    case title2R
    
    case headline1B
    case headline1M
    case headline1R
    
    case headline2B
    case headline2M
    case headline2R
    
    case bodyB
    case bodyM
    case bodyR
    
    case labelB
    case labelM
    case labelR
    
    case captionB
    case captionM
    case captionR
    
    public var font: Font {
        switch self {
        case .title1B: .wanted(.Bold, size: 28)
        case .title1M: .wanted(.Medium, size: 28)
        case .title1R: .wanted(.Regular, size: 28)
        case .title2B: .wanted(.Bold, size: 24)
        case .title2M: .wanted(.Medium, size: 24)
        case .title2R: .wanted(.Regular, size: 24)
        case .headline1B: .wanted(.Bold, size: 20)
        case .headline1M: .wanted(.Medium, size: 20)
        case .headline1R: .wanted(.Regular, size: 20)
        case .headline2B: .wanted(.Bold, size: 18)
        case .headline2M: .wanted(.Medium, size: 18)
        case .headline2R: .wanted(.Regular, size: 18)
        case .bodyB: .wanted(.Bold, size: 16)
        case .bodyM: .wanted(.Medium, size: 16)
        case .bodyR: .wanted(.Regular, size: 16)
        case .labelB: .wanted(.Bold, size: 14)
        case .labelM: .wanted(.Medium, size: 14)
        case .labelR: .wanted(.Regular, size: 14)
        case .captionB: .wanted(.Bold, size: 12)
        case .captionM: .wanted(.Medium, size: 12)
        case .captionR: .wanted(.Regular, size: 12)
        }
    }
}

public extension View {
    func myFont(_ myFont: MyFont) -> some View {
        self.font(myFont.font)
    }
}

#Preview {
    VStack {
        ForEach(MyFont.allCases, id: \.self) {
            Text("Hello World")
                .myFont($0)
        }
    }
    .registerWanted()
}
