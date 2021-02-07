#if os(macOS)
import AppKit
#else
import UIKit
#endif

extension BaseView {
    @discardableResult
    open func body(@BodyBuilder block: BodyBuilder.SingleView) -> Self {
        addItem(block())
        return self
    }
    
    func addItem(_ item: BodyBuilderItemable, at index: Int? = nil) {
        addItem(item.bodyBuilderItem, at: index)
    }
    
    func addItem(_ item: BodyBuilderItem, at index: Int? = nil) {
        switch item {
        case .single(let view):
            add(views: [view], at: index)
        case .multiple(let views):
            add(views: views, at: index)
        case .forEach(let fr):
            let subview = UView().edgesToSuperview()
            fr.allItems().forEach {
                subview.addItem($0)
            }
            add(views: [subview], at: index)
            fr.subscribeToChanges({}, { deletions, insertions, _ in
                subview.subviews.removeFromSuperview(at: deletions)
                insertions.forEach {
                    subview.addItem(fr.items(at: $0), at: $0)
                }
            }) {}
            break
        case .nested(let items):
            items.forEach { addItem($0, at: index) }
            break
        case .none:
            break
        }
    }
    
    func add(views: [BaseView], at index: Int?) {
        guard let index = index else {
            addSubview(views)
            return
        }
        let nextViews = subviews.dropFirst(index)
        nextViews.forEach { $0.removeFromSuperview() }
        addSubview(views)
        nextViews.forEach { self.addSubview($0) }
    }
}
