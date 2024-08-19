import SwiftUI

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
}

#Preview {
    VStack {
        ForEach(MyFont.allCases, id: \.self) {
            Text("테스트")
                .myFont($0)
        }
    }
    .registerWanted()
}
