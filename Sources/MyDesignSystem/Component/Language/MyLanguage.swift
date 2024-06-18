import SwiftUI

public struct MyLanguage: View {
    
    private let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .myFont(.labelM)
            .myColor(.textDarken)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .myBackground(.background)
            .frame(height: 34)
            .cornerRadius(17, corners: .allCorners)
    }
}
