import SwiftUI

public extension GrowColorScheme {
    var lightColor: Color {
        switch self {
        case .textNormal: GrowPallete.shared.Neutral90
        case .textDarken: GrowPallete.shared.Neutral80
        case .textAlt: GrowPallete.shared.Neutral50
        case .textInverse: GrowPallete.shared.Neutral10
        case .textDisabled: GrowPallete.shared.Neutral40
        case .textWarning: GrowPallete.shared.Red70
        case .buttonPrimary: GrowPallete.shared.Primary60
        case .buttonPrimaryPressed: GrowPallete.shared.Primary80
        case .buttonPrimaryDisabled: GrowPallete.shared.Neutral20
        case .buttonText: GrowPallete.shared.Neutral90
        case .buttonTextDisabled: GrowPallete.shared.Neutral40
        case .tabButtonPrimary: GrowPallete.shared.Neutral90
        case .radioButtonPrimary: GrowPallete.shared.Neutral90
        case .radioButtonPrimaryDisabled: GrowPallete.shared.Neutral40
        case .radioButtonSecondary: GrowPallete.shared.Neutral70
        case .radioButtonSecondaryDisabled: GrowPallete.shared.Neutral50
        case .background: GrowPallete.shared.Neutral00
        case .backgroundAlt: GrowPallete.shared.Neutral10
        case .backgroundInverse: GrowPallete.shared.Neutral80
        case .github: Color(0xFF24292E)
        case .baekjoon: Color(0xFF0076C0)
        case .dividerNormal: GrowPallete.shared.Neutral20
        case .textFieldIcon: GrowPallete.shared.Neutral90
        case .textFieldIconDisabled: GrowPallete.shared.Neutral50
        case .textFieldPrimary: GrowPallete.shared.Primary80
        case .textFieldSecondary: GrowPallete.shared.Neutral30
        case .textFieldSecondaryDisabled: GrowPallete.shared.Neutral20
        case .textFieldTextDisabled: GrowPallete.shared.Neutral40
        case .avatarLabel: GrowPallete.shared.Neutral30
        case .avatarBackground: GrowPallete.shared.Neutral20
        case .elevationBlack1: GrowPallete.shared.Neutral100
        case .elevationBlack2: GrowPallete.shared.Neutral100
        case .elevationBlack3: GrowPallete.shared.Neutral100
        case .bottomTabPrimary: GrowPallete.shared.Neutral70
        case .bottomTabPrimaryDisabled: GrowPallete.shared.Neutral40
        case .bottomTabSecondary: GrowPallete.shared.Neutral30
        case .likePrimary: GrowPallete.shared.Red60
        case .likePrimaryDisabled: GrowPallete.shared.Neutral40
        case .likeSecondary: GrowPallete.shared.Red10
        case .likeSecondaryDisabled: GrowPallete.shared.Neutral20
        }
    }
    
    var darkColor: Color {
        switch self {
        case .textNormal: GrowPallete.shared.Neutral10
        case .textDarken: GrowPallete.shared.Neutral50
        case .textAlt: GrowPallete.shared.Neutral60
        case .textInverse: GrowPallete.shared.Neutral10
        case .textDisabled: GrowPallete.shared.Neutral40
        case .textWarning: GrowPallete.shared.Red60
        case .buttonPrimary: GrowPallete.shared.Primary60
        case .buttonPrimaryPressed: GrowPallete.shared.Primary80
        case .buttonPrimaryDisabled: GrowPallete.shared.Neutral70
        case .buttonText: GrowPallete.shared.Neutral90
        case .buttonTextDisabled: GrowPallete.shared.Neutral60
        case .tabButtonPrimary: GrowPallete.shared.Primary60
        case .radioButtonPrimary: GrowPallete.shared.Primary60
        case .radioButtonPrimaryDisabled: GrowPallete.shared.Neutral60
        case .radioButtonSecondary: GrowPallete.shared.Neutral20
        case .radioButtonSecondaryDisabled: GrowPallete.shared.Neutral50
        case .background: GrowPallete.shared.Neutral80
        case .backgroundAlt: GrowPallete.shared.Neutral90
        case .backgroundInverse: GrowPallete.shared.Neutral00
        case .github: GrowPallete.shared.Neutral10
        case .baekjoon: GrowPallete.shared.Neutral10
        case .dividerNormal: GrowPallete.shared.Neutral70
        case .textFieldIcon: GrowPallete.shared.Primary60
        case .textFieldIconDisabled: GrowPallete.shared.Primary30
        case .textFieldPrimary: GrowPallete.shared.Primary80
        case .textFieldSecondary: GrowPallete.shared.Neutral70
        case .textFieldSecondaryDisabled: GrowPallete.shared.Neutral70
        case .textFieldTextDisabled: GrowPallete.shared.Neutral70
        case .avatarLabel: GrowPallete.shared.Neutral80
        case .avatarBackground: GrowPallete.shared.Neutral70
        case .elevationBlack1: Color(0xFFCCCCD6)
        case .elevationBlack2: Color(0xFFCCCCD6)
        case .elevationBlack3: Color(0xFFCCCCD6)
        case .bottomTabPrimary: GrowPallete.shared.Primary40
        case .bottomTabPrimaryDisabled: GrowPallete.shared.Neutral60
        case .bottomTabSecondary: GrowPallete.shared.Neutral70
        case .likePrimary: GrowPallete.shared.Red60
        case .likePrimaryDisabled: GrowPallete.shared.Neutral40
        case .likeSecondary: GrowPallete.shared.Transparent
        case .likeSecondaryDisabled: GrowPallete.shared.Neutral80
        }
    }
}
