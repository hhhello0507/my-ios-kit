import SwiftUI

public extension View {
    @ViewBuilder
    func `if`<Content: View>(
        _ condition: Bool,
        transform: (Self) -> Content
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder
    func `if`<Content: View>(
        _ condition: Bool,
        then trueTransform: (Self) -> Content,
        else falseTransform: (Self) -> Content
    ) -> some View {
        if condition {
            trueTransform(self)
        } else {
            falseTransform(self)
        }
    }
    
    @ViewBuilder
    func content<Content: View>(
        @ViewBuilder content: (Self) -> Content
    ) -> some View {
        content(self)
    }
}
