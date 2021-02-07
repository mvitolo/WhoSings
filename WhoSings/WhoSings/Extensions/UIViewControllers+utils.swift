//
//  UIViewControllers+utils.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 05/02/2021.
//

import UIKit

extension UIViewController {
    @objc dynamic fileprivate func dismissPresentedViewController() {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    func useDismissButton(_ title: String? = nil, onLeft: Bool = true, target: AnyObject? = nil, action: Selector? = nil) {
        let target = target ?? self
        let action = action ?? #selector(UIViewController.dismissPresentedViewController)

        let button = UIBarButtonItem(image: UIImage(named: "iconBack"), style: .plain, target: target, action: action)

        if onLeft {
            self.navigationItem.leftBarButtonItem = button
        } else {
            self.navigationItem.rightBarButtonItem = button
        }
    }
}
