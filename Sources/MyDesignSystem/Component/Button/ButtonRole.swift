//
//  File.swift
//  
//
//  Created by hhhello0507 on 8/19/24.
//

import Foundation

public enum ButtonRole: CaseIterable {
    case primary
    case secondary
    case assistive
    
    var foreground: Colorable {
        switch self {
        case .primary: Sementic.Static.white
        case .secondary: Sementic.Primary.normal
        case .assistive: Sementic.Label.neutral
        }
    }
    
    var background: Colorable {
        switch self {
        case .primary: Sementic.Primary.normal
        case .secondary: Sementic.Primary.assistive
        case .assistive: Sementic.Fill.neutral
        }
    }
    
    var strokeForeground: Colorable {
        switch self {
        case .primary: Sementic.Primary.normal
        case .secondary: Sementic.Primary.normal
        case .assistive: Sementic.Label.neutral
        }
    }
    
    var strokeColor: Colorable {
        switch self {
        case .primary: Sementic.Primary.normal
        case .secondary: Sementic.Primary.assistive
        case .assistive: Sementic.Fill.neutral
        }
    }
}
