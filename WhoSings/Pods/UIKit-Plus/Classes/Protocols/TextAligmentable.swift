#if os(macOS)
import AppKit
#else
import UIKit
#endif

public protocol TextAligmentable {
    func alignment(_ alignment: NSTextAlignment) -> Self
}

protocol _TextAligmentable: TextAligmentable {
    func _setTextAlignment(v: NSTextAlignment)
}

@available(iOS 13.0, *)
extension TextAligmentable {
    @discardableResult
    public func alignment(_ alignment: NSTextAlignment) -> Self {
        guard let s = self as? _TextAligmentable else { return self }
        s._setTextAlignment(v: alignment)
        return self
    }
}

// for iOS lower than 13
extension _TextAligmentable {
    @discardableResult
    public func alignment(_ alignment: NSTextAlignment) -> Self {
        _setTextAlignment(v: alignment)
        return self
    }
}
