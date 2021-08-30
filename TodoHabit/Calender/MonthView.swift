//
//  MonthView.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/27.
//

import UIKit

protocol MonthViewDelegate: AnyObject {
    func didChangeMonth(monthIndex: Int, year: Int)
}

class MonthView: UIView {
    
    var monthsArr = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    var currentMonthIndex = 0
    var currentYear = 0
    var delegate: MonthViewDelegate?
    
    let monthYearLabel: UILabel = {
        let label = UILabel()
        label.text = "Default Month year text"
        label.textColor = Style.monthViewLabelColor
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    @objc func leftRightPressed(sender: UIButton) {
        if sender == rightButton {
            currentMonthIndex += 1
            if currentMonthIndex > 11 {
                currentMonthIndex = 0
                currentYear += 1
            }
        } else {
            currentMonthIndex -= 1
            if currentMonthIndex < 0 {
                currentMonthIndex = 11
                currentYear -= 1
            }
        }
        monthYearLabel.text = "\(monthsArr[currentMonthIndex]) \(currentYear)"
        print("monthYearLabelText : \(monthsArr[currentMonthIndex]) \(currentYear)")
        delegate?.didChangeMonth(monthIndex: currentMonthIndex, year: currentYear)
        print("left or right button clicked!")
    }
    
     let leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("<", for: .normal)
        button.setTitleColor(Style.monthViewButtonRightColor, for: .normal)
        button.addTarget(self, action: #selector(leftRightPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
     let rightButton: UIButton = {
        let button = UIButton()
        button.setTitle(">", for: .normal)
        button.setTitleColor(Style.monthViewButtonRightColor, for: .normal)
        button.addTarget(self, action: #selector(leftRightPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        print("currentMonthIndex : \(currentMonthIndex), currentYear : \(currentYear)")
        
        setupViews()
    }
    // where is my monthYearLabel ? ??
    func setupViews() {
        
        addSubview(leftButton)
        leftButton.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor)
        leftButton.setWidth(50)
        
        addSubview(rightButton)
        rightButton.anchor(top: topAnchor, bottom: bottomAnchor, right:rightAnchor)
        rightButton.setWidth(50)
        
        addSubview(monthYearLabel)
        monthYearLabel.anchor(top: topAnchor, bottom: bottomAnchor)
        monthYearLabel.centerX(inView: self)
        monthYearLabel.setWidth(150)
        
        monthYearLabel.text = "\(monthsArr[currentMonthIndex]) \(currentYear)"
        print("monthYearLabel2: \(monthsArr[currentMonthIndex]) \(currentYear)")
        backgroundColor = Colors.darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
