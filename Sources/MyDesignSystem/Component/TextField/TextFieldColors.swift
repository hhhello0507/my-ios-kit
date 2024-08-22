//
//  File.swift
//  
//
//  Created by hhhello0507 on 8/21/24.
//

import Foundation

public struct TextFieldColors {
    // defaut
    public let hintColor: Colorable
    public let strokeColor: Colorable

    // unfocused
    public let foregroundColor: Colorable
    public let iconColor: Colorable

    // focused
    public let tintColor: Colorable // for indicator color
    public let focusedStrokeColor: Colorable
    
    // error
    public let errorStrokeColor: Colorable
    public let errorIconColor: Colorable
    public let errorTintColor: Colorable
    public let errorSupportTextColor: Colorable
    
    public static let `default` = TextFieldColors(
        hintColor: Colors.Label.assistive,
        strokeColor: Colors.Line.normal,
        foregroundColor: Colors.Label.strong,
        iconColor: Colors.Label.alternative,
        tintColor: Colors.Primary.normal,
        focusedStrokeColor: Colors.Primary.normal,
        errorStrokeColor: Colors.Status.negative,
        errorIconColor: Colors.Status.negative,
        errorTintColor: Colors.Status.negative,
        errorSupportTextColor: Colors.Status.negative
    )
}
