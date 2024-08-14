import SwiftUI
#if canImport(UIKit) && DEBUG
import UIKit

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    func toPreview() -> some View {
        Preview(viewController: self)
    }
}
extension UIView {
    private struct Preview: UIViewRepresentable {
        
        let view: UIView
        
        func makeUIView(context: Context) -> some UIView {
            return view
        }
        
        func updateUIView(_ uiView: UIViewType, context: Context) {}
    }
    
    func toPreview() -> some View {
        Preview(view: self)
    }
}
#endif
