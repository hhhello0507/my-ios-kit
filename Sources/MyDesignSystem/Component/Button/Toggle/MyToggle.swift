//
//  AlimoSwitch.swift
//  App
//
//  Created by dgsw8th71 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

public struct MyToggle: View {
    
    @Binding var isOn: Bool
    
    public init(
        isOn: Binding<Bool>
    ) {
        self._isOn = isOn
    }
    
    public var body: some View {
        Toggle("", isOn: $isOn)
            .tint(
                isOn
                ? Sementic.Primary.normal
                : Sementic.Fill.alternative
            )
            .fixedSize()
    }
}

#Preview {
    VStack {
        MyToggle(isOn: .constant(true))
        MyToggle(isOn: .constant(false))
    }
}

#Preview {
    VStack {
        MyToggle(isOn: .constant(true))
        MyToggle(isOn: .constant(false))
    }
    .preferredColorScheme(.dark)
}
