//
//  AddNeHabitController.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/09/07.
//

import Foundation
import UIKit


class AddNeHabitController: UIViewController {
    
//    weak var delegate: AddHabitDelegate?
    
    private let controllerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "어떤 습관을 함께 줄여볼까요?"
        label.textAlignment = .center
        return label
    }()
    
    
    private let titleLabel = CustomLabel(text: "습관 이름 :")
    
    private let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "금연하기"
        tf.autocorrectionType = .no
        return tf
    }()
    
    
    private let onDateLabel = CustomLabel(text: "요일 선택 : ")
    
    private let weekDays = CustomButton(with: "주중")
    private let weekends = CustomButton(with: "주말")
    private let everyday = CustomButton(with: "매일")
    private let selection = CustomButton(with: "선택")
    
    
    private let mon = CustomButton(with: "월")
    private let tue = CustomButton(with: "화")
    private let wed = CustomButton(with: "수")
    private let thu = CustomButton(with: "목")
    private let fri = CustomButton(with: "금")
    private let sat = CustomButton(with: "토")
    private let sun = CustomButton(with: "일")
    
    private let colorLabel = CustomLabel(text: "색상")
    
    private lazy var color0 : ColorButton = {
        let button = ColorButton(hexcolor: "#FF0000", tagInt: 0)
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let color1 = ColorButton(hexcolor: "#00FF00", tagInt: 1)
    private let color2 = ColorButton(hexcolor: "#0000FF", tagInt: 2)
    private let color3 = ColorButton(hexcolor: "#FFFF00", tagInt: 3)
    private let color4 = ColorButton(hexcolor: "#FF00FF", tagInt: 4)
    private lazy var color5 = ColorButton(hexcolor: "#00FFFF", tagInt: 5)
    
    
    private let goalPeriodLabel = CustomLabel(text: "목표 기간 :")
    
    private let goalPeriodTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "100"
        tf.keyboardType = .decimalPad
        tf.textAlignment = .right
        return tf
    }()
    
    private let daysLabel = CustomLabel( text: "일", alignment: .center)
    
    private let infiniteBox: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(white: 0.5, alpha: 0.2)
        return button
    }()
    
    private let infiniteLabel = CustomLabel(text: "항 상")
    
    private let goalStartDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .automatic
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.timeZone = .autoupdatingCurrent
        return datePicker
    }()
    
    private let tilde = CustomLabel(textColor: .black, text: "~", alignment: .center)
    
    private let goalEndDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ko-KR")
        datePicker.timeZone = .autoupdatingCurrent
        datePicker.date = Date().addingTimeInterval(dayInSec * 100)
        datePicker.preferredDatePickerStyle = .automatic
        return datePicker
    }()
    
    private let horizontalLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
//    private let alarmLabel: UILabel = {
//        let label = UILabel()
//        label.text = "알람"
//        return label
//    }()
//
//    private let alarmTimePicker: UIDatePicker = {
//        let picker = UIDatePicker()
//        picker.datePickerMode = .time
//        return picker
//    }()
    
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
//
//    private let startTimePicker: UIDatePicker = {
//        let picker = UIDatePicker()
//        picker.datePickerMode = .time
//        return picker
//    }()
//
//    private let tilde2 = CustomLabel(textColor: .black, text: "~", alignment: .center)
//
//    private let endTimePicker: UIDatePicker = {
//        let picker = UIDatePicker()
//        picker.datePickerMode = .time
//        return picker
//    }()
    
//    private let
    
//    goalLabel, goalRep, goalDuration, goalRepTF, goalDurationTF, goalRepSuffix, goalDurationSuffix
    
//    private let
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
    
    
    
    
//    @objc func makeHabit() {
//        print("makeHabit triggered")
//        guard let title = titleTextField.text else { return }
//        let dates = [1,2,3]
//        guard let goalStr = goalPeriodTF.text else { return }
//        guard let goalInt = Int(goalStr) else { return }
//        print("what is wrong.. ? ")
//        delegate?.addHabit(with: title, dates: dates, goal: goalInt)
//        print("call delegate")
//        self.dismiss(animated: true, completion: nil)
//        print("dismissed")
//    }
    
    
    
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
        view.addSubview(controllerLabel)
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)
        
        view.addSubview(onDateLabel)
        
        view.addSubview(colorLabel)
        
        view.addSubview(goalPeriodLabel)
        view.addSubview(goalPeriodTF)
        view.addSubview(daysLabel)
        
        view.addSubview(infiniteBox)
        view.addSubview(infiniteLabel)
        
        view.addSubview(goalStartDatePicker)
        view.addSubview(tilde)
        view.addSubview(goalEndDatePicker)
        
        view.addSubview(horizontalLine)
        // cover under with box .
//        view.addSubview(alarmLabel)
//        view.addSubview(alarmTimePicker)
        view.addMultipleViews(views: [goalLabel, goalRepPre, goalDurationPre, goalRepTF, goalDurationTF, goalRepSuffix, goalDurationSuffix])
        
//        view.addSubview(routineTimeLabel)
//        view.addSubview(startTimePicker)
//        view.addSubview(endTimePicker)
//        view.addSubview(tilde2)
//        goalLabel, goalRep, goalDuration, goalRepTF, goalDurationTF, goalRepSuffix, goalDurationSuffix
//        UIPickerView
//        UIDatePicker
        
        let bigDaysStackView = UIStackView(arrangedSubviews: [weekDays, weekends, everyday, selection])
        bigDaysStackView.distribution = .fillEqually
        bigDaysStackView.spacing = 0
        
        // do it later
        let smallDaysStackView = UIStackView(arrangedSubviews: [mon, tue, wed, thu, fri, sat, sun])
        smallDaysStackView.distribution = .fillEqually
        smallDaysStackView.spacing = -1
        
        let colorsStackView = UIStackView(arrangedSubviews: [color0, color1, color2, color3, color4, color5])
        colorsStackView.distribution = .fillEqually
        colorsStackView.spacing = 13
        
        view.addSubview(bigDaysStackView)
        view.addSubview(smallDaysStackView)
        view.addSubview(colorsStackView)
        
        
//        let smallSpacing: CGFloat = 10
//        let bigSpacing: CGFloat = 25
        
        controllerLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40)
        controllerLabel.centerX(inView: view)
//        controllerLabel.setDimensions(height: 40, width: 200)
        controllerLabel.setHeight(40)
        
        titleLabel.anchor(top: controllerLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 35, paddingLeft: horPadding)
        titleLabel.setDimensions(height: 40, width: 80)
        
        titleTextField.anchor(top: controllerLabel.bottomAnchor, left: titleLabel.rightAnchor, right: view.rightAnchor, paddingTop: 35, paddingLeft: 20, paddingRight: horPadding)
        titleTextField.setHeight(40)
        
        onDateLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: bigSpacing, paddingLeft: 20)
        onDateLabel.setDimensions(height: 40, width: 80)
        
        bigDaysStackView.anchor(top: titleTextField.bottomAnchor, left: onDateLabel.rightAnchor, right: view.rightAnchor, paddingTop: bigSpacing, paddingLeft: 20, paddingRight: 20)
        bigDaysStackView.setHeight(30)
        
        smallDaysStackView.anchor(top: bigDaysStackView.bottomAnchor, left: bigDaysStackView.leftAnchor, right: bigDaysStackView.rightAnchor, paddingTop: smallSpacing)
        smallDaysStackView.setHeight(30)
        
        
        colorLabel.anchor(top: smallDaysStackView.bottomAnchor, left: onDateLabel.leftAnchor, right: onDateLabel.rightAnchor, paddingTop: bigSpacing)
        colorLabel.setHeight(30)
        
        colorsStackView.anchor(top: smallDaysStackView.bottomAnchor, left: smallDaysStackView.leftAnchor, right: smallDaysStackView.rightAnchor, paddingTop: bigSpacing)
        colorsStackView.setHeight(30)
        
        
        
        horizontalLine.anchor(top: colorsStackView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing)
        horizontalLine.setHeight(2)
        
        
        
        goalLabel.anchor(top: horizontalLine.bottomAnchor, left: titleLabel.leftAnchor,  right: titleLabel.rightAnchor, paddingTop: bigSpacing)
        goalLabel.setHeight(40)
        
        goalRepPre.anchor(top: horizontalLine.bottomAnchor, left: titleTextField.leftAnchor, paddingTop: bigSpacing)
        goalRepPre.setDimensions(height: 30, width: 50)
        
        goalRepTF.anchor(top: horizontalLine.bottomAnchor, left: goalRepPre.rightAnchor, paddingTop: bigSpacing, paddingLeft: 10)
        goalRepTF.setDimensions(height: 30, width: 60)
        
        goalRepSuffix.anchor(top: horizontalLine.bottomAnchor, left: goalRepTF.rightAnchor, paddingTop: bigSpacing, paddingLeft: 10)
        goalRepSuffix.setDimensions(height: 30, width: 30)
        
        goalDurationPre.anchor(top: goalRepPre.bottomAnchor, left: titleTextField.leftAnchor, paddingTop: smallSpacing)
        goalDurationPre.setDimensions(height: 30, width: 50)
        
        goalDurationTF.anchor(top: goalRepPre.bottomAnchor, left: goalDurationPre.rightAnchor, paddingTop: smallSpacing, paddingLeft: 10)
        goalDurationTF.setDimensions(height: 30, width: 60)
        
        goalDurationSuffix.anchor(top: goalRepPre.bottomAnchor, left: goalDurationTF.rightAnchor, paddingTop: smallSpacing, paddingLeft: 10)
        goalDurationSuffix.setDimensions(height: 30, width: 30)
        
        goalPeriodLabel.anchor(top: goalDurationSuffix.bottomAnchor, left: view.leftAnchor, paddingTop: bigSpacing, paddingLeft: 20)
        goalPeriodLabel.setDimensions(height: 30, width: 80)
        
        goalPeriodTF.anchor(top: goalDurationSuffix.bottomAnchor, left: goalPeriodLabel.rightAnchor, paddingTop: bigSpacing, paddingLeft: 20, paddingRight: 20)
        goalPeriodTF.setDimensions(height: 30, width: 80)
        
        daysLabel.anchor(top: goalDurationSuffix.bottomAnchor, left: goalPeriodTF.rightAnchor, paddingTop: bigSpacing, paddingLeft: 10)
        daysLabel.setDimensions(height: 30, width: 15)
        
        infiniteBox.anchor(top: goalDurationSuffix.bottomAnchor, left: daysLabel.rightAnchor, paddingTop: bigSpacing, paddingLeft: 25)
        infiniteBox.setDimensions(height: 30, width: 35)
        
        infiniteLabel.anchor(top: goalDurationSuffix.bottomAnchor, left: infiniteBox.rightAnchor,right: view.rightAnchor ,paddingTop: bigSpacing, paddingLeft: 15, paddingRight: 20)
        infiniteLabel.setHeight(30)
        
        goalStartDatePicker.anchor(top: goalPeriodTF.bottomAnchor, left: goalPeriodTF.leftAnchor, paddingTop: smallSpacing)
        goalStartDatePicker.setDimensions(height: 30, width: 115)
        
        goalEndDatePicker.anchor(top: goalPeriodTF.bottomAnchor, right: view.rightAnchor, paddingTop: smallSpacing, paddingRight: 20)
        goalEndDatePicker.setDimensions(height: 30, width: 115)
        
        tilde.anchor(top: goalPeriodTF.bottomAnchor, left: goalStartDatePicker.rightAnchor, right: goalEndDatePicker.leftAnchor, paddingTop: smallSpacing)
        tilde.setHeight(30)




        let confirmStackView = UIStackView(arrangedSubviews: [nextButton, cancelButton])
        confirmStackView.spacing = 15
        confirmStackView.distribution = .fillEqually
        view.addSubview(confirmStackView)
        
        confirmStackView.anchor( left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 50, paddingBottom: 50, paddingRight: 50)
        confirmStackView.setHeight(35)
    }
}
