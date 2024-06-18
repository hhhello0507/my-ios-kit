import SwiftUI
import UIKit

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

func makeUIView() -> UIView {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.alignment = .center
    MyFont.allCases.forEach {
        let label = UILabel()
        label.font = $0.uiFont
        label.text = "테스트"
        stackView.addArrangedSubview(label)
    }
    return stackView
}

#Preview("MyFont+UIKit") {
    VStack {
        makeUIView().toPreview()
    }
    .registerWanted()
}
