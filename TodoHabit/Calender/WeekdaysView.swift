//
//  WeekdaysView.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/27.
//

import UIKit

class WeekdaysView: UIView {
    
    let myStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
//        backgroundColor = UIColor.white
//        backgroundColor = .cyan
//        backgroundColor = .yellow
        
        setupViews()
    }
    
    func setupViews(){
        addSubview(myStackView)
        myStackView.fillSuperview()
        backgroundColor = Colors.darkGray
        let daysArr = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
        
        for i in 0 ..< 7 {
            let label = UILabel()
            label.text = daysArr[i]
            label.textAlignment = .center
            label.textColor = Style.weekdaysLabelColor
//            label.textColor = .darkGray
            myStackView.addArrangedSubview(label)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
