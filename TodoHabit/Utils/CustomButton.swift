//
//  CustomButton.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/26.
//

import UIKit
import UIColor_Hex_Swift

class CustomButton: UIButton {
    
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


class ColorButton: UIButton {
    init(hexcolor: String, tagInt: Int) {
        super.init(frame: .zero)

        
        backgroundColor = UIColor(hexcolor)
        tag = tagInt
//        self.makeCornerRadius(circle: true)
//        layer.cornerRadius = self.frame.height / 2
        layer.cornerRadius = 15
//        layer.cornerRadius = 15
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class CustomLabel: UILabel {
    init(textColor: UIColor = .black, text: String = "", alignment: NSTextAlignment = .left) {
        super.init(frame: .zero)
        self.textColor = textColor
        self.text = text
        self.textAlignment = alignment
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
