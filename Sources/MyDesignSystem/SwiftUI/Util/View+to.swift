import SwiftUI
import UIKit

public extension View {
    func toLeading() -> some View {
        HStack(spacing: 0) {
            self
            Spacer()
        }
    }
    
    func toTrailing() -> some View {
        HStack(spacing: 0) {
            Spacer()
            self
        }
    }
    
    func toTop() -> some View {
        VStack(spacing: 0) {
            self
            Spacer()
        }
    }
    
    func toBottom() -> some View {
        VStack(spacing: 0) {
            Spacer()
            self
        }
    }
    
    func toCenter() -> some View {
        VStack(spacing: 0) {
            Spacer()
            HStack(spacing: 0) {
                Spacer()
                self
                Spacer()
            }
            Spacer()
        }
    }
}

public extension View {
    func frame(size: CGFloat) -> some View {
        self
            .frame(width: size, height: size)
    }
}
