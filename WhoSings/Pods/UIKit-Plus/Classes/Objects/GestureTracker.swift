#if os(macOS)
import AppKit
#else
import UIKit
#endif

class _GestureTracker {
    var change: ((UGestureRecognizer.State) -> Void)?
    var possible: (() -> Void)?
    var began: (() -> Void)?
    var changed: (() -> Void)?
    var ended: (() -> Void)?
    var cancelled: (() -> Void)?
    var failed: (() -> Void)?
    
    weak var outerDelegate: UGestureRecognizerDelegate?
    
    init () {}
    
    #if os(macOS)
    @objc func handle(_ gesture: NSGestureRecognizer) {
        change?(gesture.state)
        switch gesture.state {
        case .possible: possible?()
        case .began: began?()
        case .changed: changed?()
        case .ended: ended?()
        case .cancelled: cancelled?()
        case .failed: failed?()
        @unknown default:
            assertionFailure("GestureTracker case not supported")
        }
    }
    #else
    @objc func handle(_ gesture: UILongPressGestureRecognizer) {
        change?(gesture.state)
        switch gesture.state {
        case .possible: possible?()
        case .began: began?()
        case .changed: changed?()
        case .ended: ended?()
        case .cancelled: cancelled?()
        case .failed: failed?()
        @unknown default:
            assertionFailure("GestureTracker case not supported")
        }
    }
    #endif
}
