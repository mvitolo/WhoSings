//
//  Card.swift
//  WhoSings
//
//  Created by Matteo Vitolo on 06/02/2021.
//

import UIKitPlus

class Card: UView {
    let contentView: UView
    
    init (_ view: UView) {
        self.contentView = view
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func buildView() {
        super.buildView()
        height(>=49)
        body {
            contentView
            .width(>=80)
            .corners(16)
            .background(0xC64072)
            .leadingToSuperview(>=80)
        }
    }
}

