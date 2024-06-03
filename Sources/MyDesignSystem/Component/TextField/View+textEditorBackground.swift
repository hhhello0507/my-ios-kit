import SwiftUI

public extension View {
    func textEditorBackground(_ content: Color) -> some View {
        if #available(iOS 16.0, *) {
            return self.scrollContentBackground(.hidden)
        } else {
            UITextView.appearance().backgroundColor = .clear
            return self.background(content)
        }
    }
}
