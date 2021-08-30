//
//  HabitHeader.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/26.
//

import UIKit

protocol HabitHeaderDelegate: AnyObject {
    func searchHabit()
}

class HabitHeader: UICollectionReusableView {
    
    weak var delegate: HabitHeaderDelegate?
    
    private let headerView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let searchCurrentHabitButton : UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(searchPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func searchPressed() {
        delegate?.searchHabit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerView)
        headerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

