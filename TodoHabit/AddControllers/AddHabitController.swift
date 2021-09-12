//
//  AddHabitController.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/26.
//

import UIKit

//protocol AddHabitDelegate: AnyObject {
//    func addHabit(title: String, color: String, dates: [Int], createdAt: Date, datesDuration: Int, goalDuration: Int?, goalRep: Int?, startsAt: String?, endsAt: String?)
//}

class AddHabitController: UIViewController {
    
    
    
    private let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "습관 이름을 입력해주세요"
        tf.autocorrectionType = .no
        return tf
    }()
    
    private let titleTextField2 : InputTextView = {
        let tv = InputTextView()
        tv.placeholderText = "습관 이름을 입력해주세요"
        tv.font = UIFont.systemFont(ofSize: 15)
        tv.isScrollEnabled = false
        tv.placeholderShouldCenter = true
        return tv
    }()
    
    @objc func daysSelected(_ sender: UIButton){
        print("\(sender) clicked! ")
        if !sender.isSelected {
            sender.isSelected.toggle()
            sender.backgroundColor = .magenta
        } else {
            sender.isSelected.toggle()
            sender.backgroundColor = UIColor(white: 0.7, alpha: 0.3)
        }
    }
    
    private let horizontalLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    private let alarmTimePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()
    
    private let goalRepPre = CustomLabel(text: "횟수")
    private let goalDurationPre = CustomLabel(text: "시간")
    
    
    private let testButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(testButtonPressed), for: .touchUpInside)
        button.setTitle("testButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    @objc func testButtonPressed() {
    }
    
    
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
    
    private lazy var daysView = DaysView()
    private lazy var colorsView = ColorsView()
    private let goalView = GoalView()
    private var goalDurationDatesView = GoalDurationDatesView()
    
    private var routineTimeView = RoutineTimeView()
    
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
        view.addSubview(goalDurationDatesView)
        
        view.addSubview(horizontalLine)
        
        view.addSubview(goalView)
        view.addSubview(routineTimeView)
        
        view.addSubview(alarmTimePicker)
        
        titleTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,right: view.rightAnchor, paddingTop: 70, paddingLeft: horPadding, paddingRight: horPadding)
        titleTextField.setHeight(40)
        
        daysView.anchor(top: titleTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing)
        daysView.setHeight(50 + bigSpacing + smallSpacing)
        
        colorsView.anchor(top: daysView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing)
        colorsView.setHeight(30)
        
        goalDurationDatesView.anchor(top: colorsView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing)
        goalDurationDatesView.setHeight(60 + smallSpacing)
        
        horizontalLine.anchor(top: goalDurationDatesView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing)
        horizontalLine.setHeight(2)
        
        goalView.anchor(top: horizontalLine.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing, paddingRight: horPadding)
        goalView.setHeight(60 + smallSpacing)

        routineTimeView.anchor(top: goalView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing)
        routineTimeView.setHeight(30)
        
        
        alarmTimePicker.anchor(top: routineTimeView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: smallSpacing, paddingLeft: horPadding, paddingRight: horPadding)
        alarmTimePicker.setHeight(30)
        
        let confirmStackView = UIStackView(arrangedSubviews: [nextButton, cancelButton])
        confirmStackView.spacing = 15
        confirmStackView.distribution = .fillEqually
        view.addSubview(confirmStackView)
        
        confirmStackView.anchor( left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 50, paddingBottom: 50, paddingRight: 50)
        confirmStackView.setHeight(35)
    }
}

