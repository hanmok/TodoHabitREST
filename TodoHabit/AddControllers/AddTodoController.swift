//
//  AddTodoController.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/28.
//

import UIKit

protocol AddTodoViewControllerDelegate: AnyObject {
    func addTodo(title: String)
    func cancelAdd()
}

class AddTodoViewController: UIViewController {
    
    weak var delegate: AddTodoViewControllerDelegate?
    
    
    private let titleLabel = CustomLabel(text: "할일 이름 :")
    
    let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Todo 이름을 입력해주세요"
        tf.autocorrectionType = .no
        tf.textAlignment = .left
        
        return tf
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .automatic
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.timeZone = .autoupdatingCurrent
        return datePicker
    }()
    
    private let dueDateBox: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(white: 0.5, alpha: 0.2)
        return button
    }()
    
    private let dueDateLabel = CustomLabel(text: "까지 완료 ")
    
    private let horizontalLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    private let goalView = GoalView()
    
    private let routineTimeView = RoutineTimeView()
    
    private let alarmLabel: UILabel = {
        let label = UILabel()
        label.text = "알람"
        return label
    }()
    
    private let alarmTimePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(white: 0.7, alpha: 0.3)
        button.makeCornerRadius(circle: false)
        button.addTarget(self, action: #selector(makeTodo), for: .touchUpInside)
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
    
    @objc func makeTodo() {
        guard let titleText = titleTextField.text else {return}
        delegate?.addTodo(title: titleText)
        
        removeFrom()
    }
    
    func removeFrom() {
        self.willMove(toParent: nil)
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
    
    @objc func cancelPressed() {
        delegate?.cancelAdd()
        removeFrom()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(titleTextField)
        
        view.addSubview(datePicker)
        
        view.addSubview(dueDateBox)
        view.addSubview(dueDateLabel)
        
        view.addSubview(horizontalLine)
        
        
        view.addSubview(goalView)
        view.addSubview(routineTimeView)
        
        view.addSubview(alarmTimePicker)
        
        titleTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 70, paddingLeft: horPadding, paddingRight: horPadding)
        titleTextField.setHeight(40)
        
        datePicker.anchor(top: titleTextField.bottomAnchor, left: titleTextField.leftAnchor, paddingTop: 15)
        datePicker.setDimensions(height: 30, width: 120)
        
        dueDateBox.anchor(top: titleTextField.bottomAnchor, left: datePicker.rightAnchor, paddingTop: 15, paddingLeft: 10)
        dueDateBox.setDimensions(height: 30, width: 30)
        
        dueDateLabel.anchor(top: titleTextField.bottomAnchor, left: dueDateBox.rightAnchor, right: titleTextField.rightAnchor, paddingTop: 15, paddingLeft: 10)
        dueDateLabel.setHeight(30)
        
        horizontalLine.anchor(top: datePicker.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20)
        horizontalLine.setHeight(2)
        
        goalView.anchor(top: horizontalLine.bottomAnchor, left:view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing )
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
