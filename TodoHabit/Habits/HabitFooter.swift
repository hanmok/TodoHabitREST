//
//  HabitFooter.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/26.
//

import UIKit

protocol HabitFooterDelegate: AnyObject {
    func presentAddController()
}

class HabitFooter: UICollectionReusableView {
    
    weak var delegate: HabitFooterDelegate?
//    'weak' must not be applied to non-class-bound 'HabitFooterDelegate'; consider adding a protocol conformance that has a class bound
    private let addHabitButton : UIButton = {
        let button = UIButton()
        button.makeCornerRadius(circle: false)
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.backgroundColor = .magenta
        return button
        
    }()
    
    @objc func buttonPressed() {
        print("plus button pressed, from footer! ")
        delegate?.presentAddController()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(addHabitButton)
        addHabitButton.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 16, paddingBottom: 5, paddingRight: 16)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

