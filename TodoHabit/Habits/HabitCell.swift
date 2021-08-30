//
//  HabitCell.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/25.
//

import UIKit

class HabitCell: UICollectionViewCell {
    
    var habitCell: Habit?
    
    var viewModel : HabitViewModel? {
        didSet { configure() }
    }
    
    
    private var titleButton : UIButton = {
        let button = UIButton()
//        button.makeCornerRadius()
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    
    func configure() {
        guard let viewModel = viewModel else { return }
        
        titleButton.setAttributedTitle(viewModel.titleLabel, for: .normal)
//        captionLabel.text = viewModel.caption
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0.7, alpha: 0.3)
        addSubview(titleButton)
        titleButton.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 6, paddingBottom: 5, paddingRight: 6)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

