#if os(macOS)
import AppKit
#else
import UIKit
#endif

public protocol TextBindable {
    @discardableResult
    func bind<A: AnyString>(_ to: UIKitPlus.State<A>) -> Self
}

protocol _TextBindable: TextBindable {
    func _setTextBind<A: AnyString>(_ binding: State<A>?)
}

@available(iOS 13.0, *)
extension TextBindable {
    @discardableResult
    public func bind<A: AnyString>(_ to: State<A>) -> Self {
        guard let s = self as? _TextBindable else { return self }
        s._setTextBind(to)
        return self
    }
}

// for iOS lower than 13
extension _TextBindable {
    @discardableResult
    public func bind<A: AnyString>(_ to: State<A>) -> Self {
        _setTextBind(to)
        return self
    }
}
