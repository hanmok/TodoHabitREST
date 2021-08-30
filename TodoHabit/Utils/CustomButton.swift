//
//  CustomButton.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/26.
//

import UIKit

class CustomButton: UIButton {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//    }
    
    init(with title: String) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
        
        makeCornerRadius(circle: false)
        backgroundColor = UIColor(white: 0.7, alpha: 0.3)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
