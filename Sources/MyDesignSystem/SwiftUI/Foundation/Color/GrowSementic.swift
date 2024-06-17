import SwiftUI

public extension MyColorScheme {
    var lightColor: Color {
        switch self {
        case .textNormal: MyPallete.shared.Neutral90
        case .textDarken: MyPallete.shared.Neutral80
        case .textAlt: MyPallete.shared.Neutral50
        case .textInverse: MyPallete.shared.Neutral10
        case .textDisabled: MyPallete.shared.Neutral40
        case .textWarning: MyPallete.shared.Red70
        case .buttonPrimary: MyPallete.shared.Primary60
        case .buttonPrimaryPressed: MyPallete.shared.Primary80
        case .buttonPrimaryDisabled: MyPallete.shared.Neutral20
        case .buttonText: MyPallete.shared.Neutral90
        case .buttonTextDisabled: MyPallete.shared.Neutral40
        case .tabButtonPrimary: MyPallete.shared.Neutral90
        case .radioButtonPrimary: MyPallete.shared.Neutral90
        case .radioButtonPrimaryDisabled: MyPallete.shared.Neutral40
        case .radioButtonSecondary: MyPallete.shared.Neutral70
        case .radioButtonSecondaryDisabled: MyPallete.shared.Neutral50
        case .background: MyPallete.shared.Neutral00
        case .backgroundAlt: MyPallete.shared.Neutral10
        case .backgroundInverse: MyPallete.shared.Neutral80
        case .github: Color(0xFF24292E)
        case .baekjoon: Color(0xFF0076C0)
        case .dividerNormal: MyPallete.shared.Neutral20
        case .textFieldIcon: MyPallete.shared.Neutral90
        case .textFieldIconDisabled: MyPallete.shared.Neutral50
        case .textFieldPrimary: MyPallete.shared.Primary80
        case .textFieldSecondary: MyPallete.shared.Neutral30
        case .textFieldSecondaryDisabled: MyPallete.shared.Neutral20
        case .textFieldTextDisabled: MyPallete.shared.Neutral40
        case .avatarLabel: MyPallete.shared.Neutral30
        case .avatarBackground: MyPallete.shared.Neutral20
        case .elevationBlack1: MyPallete.shared.Neutral100
        case .elevationBlack2: MyPallete.shared.Neutral100
        case .elevationBlack3: MyPallete.shared.Neutral100
        case .bottomTabPrimary: MyPallete.shared.Neutral70
        case .bottomTabPrimaryDisabled: MyPallete.shared.Neutral40
        case .bottomTabSecondary: MyPallete.shared.Neutral30
        case .likePrimary: MyPallete.shared.Red60
        case .likePrimaryDisabled: MyPallete.shared.Neutral40
        case .likeSecondary: MyPallete.shared.Red10
        case .likeSecondaryDisabled: MyPallete.shared.Neutral20
        }
    }
    
    var darkColor: Color {
        switch self {
        case .textNormal: MyPallete.shared.Neutral10
        case .textDarken: MyPallete.shared.Neutral50
        case .textAlt: MyPallete.shared.Neutral60
        case .textInverse: MyPallete.shared.Neutral10
        case .textDisabled: MyPallete.shared.Neutral40
        case .textWarning: MyPallete.shared.Red60
        case .buttonPrimary: MyPallete.shared.Primary60
        case .buttonPrimaryPressed: MyPallete.shared.Primary80
        case .buttonPrimaryDisabled: MyPallete.shared.Neutral70
        case .buttonText: MyPallete.shared.Neutral90
        case .buttonTextDisabled: MyPallete.shared.Neutral60
        case .tabButtonPrimary: MyPallete.shared.Primary60
        case .radioButtonPrimary: MyPallete.shared.Primary60
        case .radioButtonPrimaryDisabled: MyPallete.shared.Neutral60
        case .radioButtonSecondary: MyPallete.shared.Neutral20
        case .radioButtonSecondaryDisabled: MyPallete.shared.Neutral50
        case .background: MyPallete.shared.Neutral80
        case .backgroundAlt: MyPallete.shared.Neutral90
        case .backgroundInverse: MyPallete.shared.Neutral00
        case .github: MyPallete.shared.Neutral10
        case .baekjoon: MyPallete.shared.Neutral10
        case .dividerNormal: MyPallete.shared.Neutral70
        case .textFieldIcon: MyPallete.shared.Primary60
        case .textFieldIconDisabled: MyPallete.shared.Primary30
        case .textFieldPrimary: MyPallete.shared.Primary80
        case .textFieldSecondary: MyPallete.shared.Neutral70
        case .textFieldSecondaryDisabled: MyPallete.shared.Neutral70
        case .textFieldTextDisabled: MyPallete.shared.Neutral70
        case .avatarLabel: MyPallete.shared.Neutral80
        case .avatarBackground: MyPallete.shared.Neutral70
        case .elevationBlack1: Color(0xFFCCCCD6)
        case .elevationBlack2: Color(0xFFCCCCD6)
        case .elevationBlack3: Color(0xFFCCCCD6)
        case .bottomTabPrimary: MyPallete.shared.Primary40
        case .bottomTabPrimaryDisabled: MyPallete.shared.Neutral60
        case .bottomTabSecondary: MyPallete.shared.Neutral70
        case .likePrimary: MyPallete.shared.Red60
        case .likePrimaryDisabled: MyPallete.shared.Neutral40
        case .likeSecondary: MyPallete.shared.Transparent
        case .likeSecondaryDisabled: MyPallete.shared.Neutral80
        }
    }
}
