#if !os(macOS)
import UIKit

public protocol TextAutocorrectionable {
    @discardableResult
    func autocorrection(_ type: UITextAutocorrectionType) -> Self
}

protocol _TextAutocorrectionable: TextAutocorrectionable {
    func _setTextAutocorrectionType(_ v: UITextAutocorrectionType)
}

@available(iOS 13.0, *)
extension TextAutocorrectionable {
    @discardableResult
    public func autocorrection(_ type: UITextAutocorrectionType) -> Self {
        guard let  s = self as? _TextAutocorrectionable else { return self }
        s._setTextAutocorrectionType(type)
        return self
    }
}

// for iOS lower than 13
extension _TextAutocorrectionable {
    @discardableResult
    public func autocorrection(_ type: UITextAutocorrectionType) -> Self {
        _setTextAutocorrectionType(type)
        return self
    }
}
#endif
