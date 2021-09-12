//
//  AddNeHabitController.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/09/07.
//

import Foundation
import UIKit


class AddNeHabitController: UIViewController {
    
    private let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "금연하기"
        tf.autocorrectionType = .no
        return tf
    }()
    
    private let daysView = DaysView()
    private let colorsView = ColorsView()
    
    
    private let horizontalLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    private let goalView = GoalView()
    private let goalDurationDatesView = GoalDurationDatesView()
    
    // set alarm time to be 5 minutes before the start time of routine
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(white: 0.7, alpha: 0.3)
        button.makeCornerRadius(circle: false)
//        button.addTarget(self, action: #selector(makeHabit), for: .touchUpInside)
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("취소", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(white: 0.7, alpha: 0.3)
        button.makeCornerRadius(circle: false)
        button.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func cancelPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        
        self.hideKeyboardWhenTappedAround()
    }
    
    func configureUI() {
        
        view.addSubview(titleTextField)
        view.addSubview(daysView)
        view.addSubview(colorsView)
        view.addSubview(horizontalLine)
        view.addSubview(goalView)
        view.addSubview(goalDurationDatesView)
        
        titleTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,right: view.rightAnchor, paddingTop: 70, paddingLeft: horPadding, paddingRight: horPadding)
        titleTextField.setHeight(40)

        daysView.anchor(top: titleTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing)
        daysView.setHeight(50 + bigSpacing + smallSpacing)
        
        colorsView.anchor(top: daysView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing)
        colorsView.setHeight(30)
        
        horizontalLine.anchor(top: colorsView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing)
        horizontalLine.setHeight(3)
        
        goalView.anchor(top: horizontalLine.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing, paddingRight: horPadding)
        goalView.setHeight(60 + smallSpacing)
        
        goalDurationDatesView.anchor(top: goalView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing)
        goalDurationDatesView.setHeight(60 + smallSpacing)

        let confirmStackView = UIStackView(arrangedSubviews: [nextButton, cancelButton])
        confirmStackView.spacing = 15
        confirmStackView.distribution = .fillEqually
        view.addSubview(confirmStackView)
        
        confirmStackView.anchor( left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 50, paddingBottom: 50, paddingRight: 50)
        confirmStackView.setHeight(35)
    }
}
