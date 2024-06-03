import SwiftUI

struct GrowAnimationButton: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .addPressAnimation(configuration.isPressed)
    }
}

public extension View {
    
    func addPressAnimation(_ isPressed: Bool) -> some View {
        self
            .opacity(isPressed ? 0.64 : 1)
            .scaleEffect(isPressed ? 0.97 : 1)
            .animation(.timingCurve(0.11, 0.9, 0.265, 0.945, duration: 0.3), value: isPressed)
            .disabled(isPressed)
    }
    
    func applyAnimation() -> some View {
        self
            .buttonStyle(GrowAnimationButton())
    }
}

public extension View {
    func hideKeyboardWhenTap() -> some View {
        onAppear(perform: UIApplication.shared.hideKeyboard)
    }
}

public extension UIApplication {
    func hideKeyboard() {
        guard let scene = connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else { return }
        let tapRecognizer = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing))
        tapRecognizer.cancelsTouchesInView = false
        tapRecognizer.delegate = self
        window.addGestureRecognizer(tapRecognizer)
    }
}

extension UIApplication: UIGestureRecognizerDelegate {
    public func gestureRecognizer(
        _ gestureRecognizer: UIGestureRecognizer,
        shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        return false
    }
}
