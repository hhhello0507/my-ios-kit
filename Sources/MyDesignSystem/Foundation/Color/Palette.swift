import SwiftUI

public enum Palette {
    
    /*
     Neutral Color
     */
    public static let neutral99 = Color(0xFCFCFD)
    public static let neutral97 = Color(0xF6F6F7)
    public static let neutral95 = Color(0xF2F2F3)
    public static let neutral90 = Color(0xE4E4E5)
    public static let neutral80 = Color(0xC8C8CC)
    public static let neutral70 = Color(0xACACB2)
    public static let neutral60 = Color(0x919199)
    public static let neutral50 = Color(0x767680)
    public static let neutral40 = Color(0x5E5E66)
    public static let neutral30 = Color(0x47474D)
    public static let neutral25 = Color(0x3B3B40)
    public static let neutral20 = Color(0x2F2F33)
    public static let neutral15 = Color(0x252528)
    public static let neutral10 = Color(0x19191B)
    public static let neutral7 = Color(0x111113)
    public static let neutral5 = Color(0x0C0C0D)
    
    /*
     Red Color
     */
    public static let red99 = Color(0xFEFBFB)
    public static let red95 = Color(0xFCE9E9)
    public static let red90 = Color(0xF9D2D2)
    public static let red80 = Color(0xF2A6A6)
    public static let red70 = Color(0xFF6666)
    public static let red60 = Color(0xEB4747)
    public static let red50 = Color(0xEE2B2B)
    public static let red40 = Color(0xBD0F0F)
    public static let red30 = Color(0x8E0B0B)
    public static let red20 = Color(0x5E0808)
    public static let red10 = Color(0x2F0404)
    
    /*
     Green Color
     */
    public static let green99 = Color(0xFBFEFB)
    public static let green95 = Color(0xE8FCEA)
    public static let green90 = Color(0xD2F9D6)
    public static let green80 = Color(0xA6F2AD)
    public static let green70 = Color(0x79EC85)
    public static let green60 = Color(0x4DE55C)
    public static let green50 = Color(0x20DF33)
    public static let green40 = Color(0x0FBD21)
    public static let green30 = Color(0x0B8E18)
    public static let green20 = Color(0x085E10)
    public static let green10 = Color(0x042F08)
    
    /*
     Yellow Color
     */
    public static let yellow99 = Color(0xFFFEFA)
    public static let yellow95 = Color(0xFFFAE5)
    public static let yellow90 = Color(0xFFF5CC)
    public static let yellow80 = Color(0xFFEB99)
    public static let yellow70 = Color(0xFFE066)
    public static let yellow60 = Color(0xFFD633)
    public static let yellow50 = Color(0xFFCC00)
    public static let yellow40 = Color(0xCCA300)
    public static let yellow30 = Color(0x997A00)
    public static let yellow20 = Color(0x665200)
    public static let yellow10 = Color(0x332900)
    
    /*
     Blue Color
     */
    public static let blue99 = Color(0xFAFDFF)
    public static let blue95 = Color(0xE5F3FF)
    public static let blue90 = Color(0xCCE8FF)
    public static let blue80 = Color(0x99D1FF)
    public static let blue70 = Color(0x66B9FF)
    public static let blue60 = Color(0x33A2FF)
    public static let blue50 = Color(0x008BFF)
    public static let blue40 = Color(0x006FCC)
    public static let blue30 = Color(0x005399)
    public static let blue20 = Color(0x003866)
    public static let blue10 = Color(0x001C33)
    
    /*
     Common
     */
    public static let common00 = Color(red: 1, green: 1, blue: 1)
    public static let common100 = Color(red: 0, green: 0, blue: 0)
}

public enum CustomPalette {
    public static var primary99 = Palette.blue99
    public static var primary95 = Palette.blue95
    public static var primary90 = Palette.blue90
    public static var primary80 = Palette.blue80
    public static var primary70 = Palette.blue70
    public static var primary60 = Palette.blue60
    public static var primary50 = Palette.blue50
    public static var primary40 = Palette.blue40
    public static var primary30 = Palette.blue30
    public static var primary20 = Palette.blue20
    public static var primary10 = Palette.blue10
}

#Preview {
    
    let data = [
        Palette.neutral99,
        Palette.neutral97,
        Palette.neutral95,
        Palette.neutral90,
        Palette.neutral80,
        Palette.neutral70,
        Palette.neutral60,
        Palette.neutral50,
        Palette.neutral40,
        Palette.neutral30,
        Palette.neutral25,
        Palette.neutral20,
        Palette.neutral15,
        Palette.neutral10,
        Palette.neutral7,
        Palette.neutral5,
    ]
    
    return VStack(spacing: 0) {
        ForEach(data, id: \.self) {
            $0
        }
    }
}
