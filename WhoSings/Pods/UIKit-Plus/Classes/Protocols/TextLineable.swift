#if os(macOS)
import AppKit
#else
import UIKit
#endif

public protocol TextLineable {
    @discardableResult
    func lines(_ number: Int) -> Self
    
    @discardableResult
    func multiline() -> Self
}

protocol _TextLineable: TextLineable {
    func _setNumbelOfLines(_ v: Int)
}

@available(iOS 13.0, *)
extension TextLineable {
    @discardableResult
    public func lines(_ number: Int) -> Self {
        guard let s = self as? _TextLineable else { return self }
        s._setNumbelOfLines(number)
        return self
    }
    
    @discardableResult
    public func multiline() -> Self {
        guard let s = self as? _TextLineable else { return self }
        s._setNumbelOfLines(0)
        return self
    }
}

// for iOS lower than 13
extension _TextLineable {
    @discardableResult
    public func lines(_ number: Int) -> Self {
        _setNumbelOfLines(number)
        return self
    }
    
    @discardableResult
    public func multiline() -> Self {
        _setNumbelOfLines(0)
        return self
    }
}
