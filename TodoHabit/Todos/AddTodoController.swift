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
    
//    let enterTodoLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Todo"
//        label.textColor = .black
//        label.textAlignment = .center
////        label.layer.cornerRadius = 20
////        label.roundCorners(corners: [.topLeft, .topRight], radius: 20)
//        label.backgroundColor = UIColor(white: 0.6, alpha: 0.9)
////        label.backgroundColor = .red
//        return label
//    }()
    
    private let controllerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "할일 만들기"
        return label
    }()
    
    private let titleLabel = CustomLabel(text: "할일 이름 :")
    
    let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Todo 이름을 입력해주세요"
        tf.autocorrectionType = .no
        tf.textAlignment = .left
        
        return tf
    }()
    
    private let dateLabel = CustomLabel(text: "일자 :")
    
   
    
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
    
    private let goalLabel = CustomLabel(text: "목표")
    
    private let goalRepPre = CustomLabel(text: "횟수")
    private let goalDurationPre = CustomLabel(text: "시간")
    
    private let goalRepTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "0 "
        tf.keyboardType = .numberPad
        tf.backgroundColor = UIColor(white: 0.5, alpha: 0.2)
        tf.layer.cornerRadius = 10
        tf.textAlignment = .right
        return tf
    }()
    
    private let goalDurationTF : UITextField = {
        let tf = UITextField()
        tf.placeholder = "0 "
        tf.keyboardType = .numberPad
        tf.backgroundColor = UIColor(white: 0.5, alpha: 0.2)
        tf.layer.cornerRadius = 10
        tf.textAlignment = .right
        return tf
    }()
    
    private let goalRepSuffix = CustomLabel(text: "회")
    private let goalDurationSuffix = CustomLabel(text: "분")
//    private let routineTimeLabel = CustomLabel(text: "시간")
    private let startEndTimeLabel = CustomLabel(text: "시간")
    
    private let startTimePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()
    private let tilde = CustomLabel(textColor: .black, text: "~", alignment: .center)
    
    private let endTimePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()
    
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
    
//    override func viewWillDisappear(_ animated: Bool) {
//        guard let titleText = titleTextField.text else {return}
//        delegate?.addTodo(title: titleText)
//    }
//    override func viewDidDisappear(_ animated: Bool) {
//        guard let titleText = titleTextField.text else {return}
//        delegate?.addTodo(title: titleText)
//    }
    
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(controllerLabel)
        
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        
        view.addSubview(dateLabel)
        view.addSubview(datePicker)
        
        view.addSubview(dueDateBox)
        view.addSubview(dueDateLabel)
        
        view.addSubview(horizontalLine)
        
        view.addSubview(goalLabel)
        
        view.addSubview(goalRepPre)
        view.addSubview(goalRepTF)
        view.addSubview(goalRepSuffix)
        
        view.addSubview(goalDurationPre)
        view.addSubview(goalDurationTF)
        view.addSubview(goalDurationSuffix)
        
        view.addSubview(startEndTimeLabel)
        
        view.addSubview(startTimePicker)
        view.addSubview(tilde)
        view.addSubview(endTimePicker)
        
        view.addSubview(alarmLabel)
        view.addSubview(alarmTimePicker)

        controllerLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
        controllerLabel.centerX(inView: view)
        controllerLabel.setDimensions(height: 40, width: 100)
        
        titleLabel.anchor(top: controllerLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 35, paddingLeft: 20)
        titleLabel.setDimensions(height: 40, width: 80)
        
        titleTextField.anchor(top: controllerLabel.bottomAnchor, left: titleLabel.rightAnchor, right: view.rightAnchor, paddingTop: 35, paddingLeft: 20, paddingRight: 20)
        titleTextField.setHeight(40)
        
        dateLabel.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, right: titleLabel.rightAnchor, paddingTop: 15)
        dateLabel.setHeight(30)
        
//        datePicker.anchor(top: titleTextField.bottomAnchor, left: titleTextField.leftAnchor, right: titleTextField.rightAnchor, paddingTop: 15)
        
        datePicker.anchor(top: titleTextField.bottomAnchor, left: titleTextField.leftAnchor, paddingTop: 15)
        datePicker.setDimensions(height: 30, width: 120)
        
        dueDateBox.anchor(top: titleTextField.bottomAnchor, left: datePicker.rightAnchor, paddingTop: 15, paddingLeft: 10)
        dueDateBox.setDimensions(height: 30, width: 30)
        
        dueDateLabel.anchor(top: titleTextField.bottomAnchor, left: dueDateBox.rightAnchor, right: titleTextField.rightAnchor, paddingTop: 15, paddingLeft: 10)
        dueDateLabel.setHeight(30)
        
        horizontalLine.anchor(top: dateLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20)
        horizontalLine.setHeight(2)
        
        goalLabel.anchor(top: horizontalLine.bottomAnchor, left: titleLabel.leftAnchor,  right: titleLabel.rightAnchor, paddingTop: 20)
        goalLabel.setHeight(40)
        
        goalRepPre.anchor(top: horizontalLine.bottomAnchor, left: titleTextField.leftAnchor, paddingTop: 30)
        goalRepPre.setDimensions(height: 30, width: 50)
        
        goalRepTF.anchor(top: horizontalLine.bottomAnchor, left: goalRepPre.rightAnchor, paddingTop: 30, paddingLeft: 10)
        goalRepTF.setDimensions(height: 30, width: 60)
        
        goalRepSuffix.anchor(top: horizontalLine.bottomAnchor, left: goalRepTF.rightAnchor, paddingTop: 30, paddingLeft: 10)
        goalRepSuffix.setDimensions(height: 30, width: 30)
        
        goalDurationPre.anchor(top: goalRepPre.bottomAnchor, left: titleTextField.leftAnchor, paddingTop: 5)
        goalDurationPre.setDimensions(height: 30, width: 50)
        
        goalDurationTF.anchor(top: goalRepPre.bottomAnchor, left: goalDurationPre.rightAnchor, paddingTop: 5, paddingLeft: 10)
        goalDurationTF.setDimensions(height: 30, width: 60)
        
        goalDurationSuffix.anchor(top: goalRepPre.bottomAnchor, left: goalDurationTF.rightAnchor, paddingTop: 5, paddingLeft: 10)
        goalDurationSuffix.setDimensions(height: 30, width: 30)
        
        startEndTimeLabel.anchor(top: goalDurationPre.bottomAnchor, left: titleLabel.leftAnchor, right: titleLabel.rightAnchor, paddingTop: 15)
        startEndTimeLabel.setHeight(30)
        
        
        startTimePicker.anchor(top: goalDurationPre.bottomAnchor, left: titleTextField.leftAnchor, paddingTop: 15)
        startTimePicker.setDimensions(height: 30, width: 115)
        
        endTimePicker.anchor(top: goalDurationPre.bottomAnchor, right: titleTextField.rightAnchor, paddingTop: 15)
        endTimePicker.setDimensions(height: 30, width: 115)
        
        tilde.anchor(top: goalDurationPre.bottomAnchor, left: startTimePicker.rightAnchor, right: endTimePicker.leftAnchor, paddingTop: 15)
        tilde.setHeight(30)
        
        alarmLabel.anchor(top: startEndTimeLabel.bottomAnchor, left: titleLabel.leftAnchor, right: titleLabel.rightAnchor, paddingTop: 15)
        alarmLabel.setHeight(30)
        
        alarmTimePicker.anchor(top: startEndTimeLabel.bottomAnchor, left: titleTextField.leftAnchor, right: titleTextField.rightAnchor, paddingTop: 15)
        alarmTimePicker.setHeight(30)
        
        
        let confirmStackView = UIStackView(arrangedSubviews: [nextButton, cancelButton])
        confirmStackView.spacing = 15
        confirmStackView.distribution = .fillEqually
        view.addSubview(confirmStackView)
        
        confirmStackView.anchor( left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 50, paddingBottom: 50, paddingRight: 50)
        confirmStackView.setHeight(35)
        
        
    }
}
