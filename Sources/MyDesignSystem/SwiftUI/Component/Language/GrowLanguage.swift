import SwiftUI

public struct GrowLanguage: View {
    
    private let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .growFont(.labelM)
            .growColor(.textDarken)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .growBackground(.background)
            .frame(height: 34)
            .cornerRadius(17, corners: .allCorners)
    }
}
