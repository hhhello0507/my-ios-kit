import SwiftUI

public struct MyTextField: View {
    
    // MARK: - State
    @FocusState private var focused: Bool
    @Binding private var text: String
    @State private var isHide = true
    
    // MARK: - parameters
    private let hint: String
    private let isSecured: Bool
    private let isEnabled: Bool
    
    public init(
        _ hint: String = "",
        text: Binding<String>,
        isSecured: Bool = false,
        isEnabled: Bool = true
    ) {
        self.hint = hint
        self._text = text
        self.isSecured = isSecured
        self.isEnabled = isEnabled
    }
    
    private var opacity: CGFloat {
        isEnabled ? 1 : 0.5
    }
    
    // MARK: - View
    public var body: some View {
        HStack(spacing: 0) {
            if isSecured && isHide {
                SecureField(
                    hint,
                    text: $text,
                    prompt: Text(hint).foreground(Colors.Label.assistive)
                )
            } else {
                TextField(
                    hint,
                    text: $text,
                    prompt: Text(hint).foreground(Colors.Label.assistive)
                )
            }
            let icon: Iconable = if isSecured {
                isHide ? Icons.Visible.Hide : Icons.Visible.Show
            } else {
                Icons.Cross.CrossFill
            }
            Button {
                if isSecured {
                    isHide.toggle()
                } else {
                    text = ""
                }
            } label: {
                Image(icon: icon)
                    .resizable()
                    .renderingMode(.template)
                    .foreground(Colors.Label.alternative)
                    .frame(width: 24, height: 24)
                    .padding(4)
                    .opacity(text.isEmpty ? 0 : 0.5)
            }
            .applyAnimation()
        }
#if canImport(UIKit)
        .textInputAutocapitalization(.never)
#endif
        .autocorrectionDisabled()
        .textContentType(.init(rawValue: ""))
        .focused($focused)
        .myFont(.headlineM)
        .foreground(Colors.Label.strong) // text color
        .frame(height: 43)
        .padding(.vertical, 4)
        .tint(Colors.Primary.normal) // indicator color
        .overlay {
            VStack {
                Spacer()
                Divider()
                    .foreground(Colors.Line.normal)
            }
        }
        .opacity(opacity)
        .disabled(!isEnabled)
        .onTapGesture {
            focused = true
        }
    }
}

struct TextFieldPreview: View {
    @State private var text = ""
    var body: some View {
        VStack {
            MyTextField("Label", text: $text)
            MyTextField("Label", text: $text, isSecured: true)
            MyTextField("Label", text: $text, isEnabled: false)
        }
        .registerWanted()
    }
}

#Preview {
    TextFieldPreview()
}

#Preview {
    TextFieldPreview()
        .preferredColorScheme(.dark)
}
