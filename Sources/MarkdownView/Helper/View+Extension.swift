import SwiftUI

extension View {
    @ViewBuilder
    func `if`(_ condition: @autoclosure @escaping () -> Bool, @ViewBuilder content: @escaping (_ content: Self) -> some View) -> some View {
        if condition() {
            content(self)
        } else {
            self
        }
    }
}

extension View {
    @ViewBuilder
    func onChange<V: Equatable>(of value: V, _ action: @escaping (V) -> Void) -> some View {
        if #available(iOS 17.0, macOS 14.0, watchOS 10.0, tvOS 17.0, macCatalyst 17.0, xrOS 1.0, *) {
            onChange(of: value) { _, newValue in
                action(newValue)
            }
        } else {
            onChange(of: value, perform: action)
        }
    }
}
