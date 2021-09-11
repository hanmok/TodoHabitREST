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

class AddHabitController2: UIViewController {
    
    
    //    weak var delegate: AddHabitDelegate?
    
    private let controllerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "습관 만들기"
        return label
    }()
    
    private let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "습관 이름을 입력해주세요"
        tf.autocorrectionType = .no
        return tf
    }()
    
    private var daysNumberPickerView : UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.isHidden = false
        return pickerView
    }()
    private let daysNumberArray = ["요일 선택", "주당 횟수 선택"]
    
    private let categorizedDaysPickerView = UIPickerView()
    private let categorizedDaysDatas = ["주중", "매일", "주말", "선택"]
    
    private let daysView = DaysView()
    private lazy var mon = CustomButton(with: "월")
    private lazy var tue = CustomButton(with: "화")
    private lazy var wed = CustomButton(with: "수")
    private lazy var thu = CustomButton(with: "목")
    private lazy var fri = CustomButton(with: "금")
    private lazy var sat = CustomButton(with: "토")
    private lazy var sun = CustomButton(with: "일")
    

    private let color0 = ColorButton(hexcolor: "#FF0000", tagInt: 0)
    private let color1 = ColorButton(hexcolor: "#00FF00", tagInt: 1)
    private let color2 = ColorButton(hexcolor: "#0000FF", tagInt: 2)
    private let color3 = ColorButton(hexcolor: "#FFFF00", tagInt: 3)
    private let color4 = ColorButton(hexcolor: "#FF00FF", tagInt: 4)
    private let color5 = ColorButton(hexcolor: "#00FFFF", tagInt: 5)
    private let color6 = ColorButton(hexcolor: "#151323", tagInt: 6)
    private let color7 = ColorButton(hexcolor: "#848513", tagInt: 7)
    private let color8 = ColorButton(hexcolor: "#884165", tagInt: 8)
    
    
    func addTargetsForDays() {
        mon.addTarget(self, action: #selector(daysSelected), for: .touchUpInside)
        tue.addTarget(self, action: #selector(daysSelected), for: .touchUpInside)
        wed.addTarget(self, action: #selector(daysSelected), for: .touchUpInside)
        thu.addTarget(self, action: #selector(daysSelected), for: .touchUpInside)
        fri.addTarget(self, action: #selector(daysSelected), for: .touchUpInside)
        sat.addTarget(self, action: #selector(daysSelected), for: .touchUpInside)
        sun.addTarget(self, action: #selector(daysSelected), for: .touchUpInside)
    }
    
    
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
        datePicker.date = Date().addingTimeInterval(86400 * 100)
        datePicker.preferredDatePickerStyle = .automatic
        return datePicker
    }()
    
    private let horizontalLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    //    private let alarmLabel = CustomLabel(text: "알람")
    //    private let alarmLabel = CustomLabel()
    
    private let alarmTimePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()
    
    //    private let goalLabel = CustomLabel(text: "목표")
    //    private let goalLabel = CustomLabel()
    
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
    //    private let routineTimeLabel = CustomLabel()
    
    private let startTimePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()
    private let tilde2 = CustomLabel(textColor: .black, text: "~", alignment: .center)
    
    private let endTimePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        return picker
    }()
    
    private let testButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(testButtonPressed), for: .touchUpInside)
        button.setTitle("testButton", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    @objc func testButtonPressed() {
        sun.isSelected = true
    }
    
    
    
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
        button.addTarget(self, action: #selector(makeHabit), for: .touchUpInside)
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
    
    
    
    
    @objc func makeHabit() {
        print("makeHabit triggered")
        guard let title = titleTextField.text else { return }
        let dates = [1,2,3]
        guard let goalStr = goalPeriodTF.text else { return }
        guard let goalInt = Int(goalStr) else { return }
        print("what is wrong.. ? ")
        //        delegate?.addHabit(with: title, dates: dates, goal: goalInt)
        print("call delegate")
        self.dismiss(animated: true, completion: nil)
        print("dismissed")
    }
    
    
    
    @objc func cancelPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addTargetsForDays()
        configureUI()
    
        
        self.hideKeyboardWhenTappedAround()
    }
    
    func configureUI() {
        
        print("configureUI called")
        view.addSubview(titleTextField)
        
        view.addSubview(daysNumberPickerView)
        daysNumberPickerView.delegate = self
        daysNumberPickerView.dataSource = self
        
        view.addSubview(categorizedDaysPickerView)
        categorizedDaysPickerView.delegate = self
        categorizedDaysPickerView.dataSource = self
        
        view.addSubview(goalPeriodTF)
        view.addSubview(daysLabel)
        
        view.addSubview(infiniteBox)
        view.addSubview(infiniteLabel)
        
        view.addSubview(goalStartDatePicker)
        view.addSubview(tilde)
        view.addSubview(goalEndDatePicker)
        
        view.addSubview(horizontalLine)
        
        view.addSubview(alarmTimePicker)
        view.addMultipleViews(views: [goalRepPre, goalDurationPre, goalRepTF, goalDurationTF, goalRepSuffix, goalDurationSuffix])
        
        view.addSubview(startTimePicker)
        view.addSubview(endTimePicker)
        view.addSubview(tilde2)
        view.addSubview(testButton)
        
        view.addSubview(daysView)
        // do it later
        let smallDaysStackView = UIStackView(arrangedSubviews: [mon, tue, wed, thu, fri, sat, sun])
        smallDaysStackView.distribution = .fillEqually
        smallDaysStackView.spacing = 0
        
        let colorsStackView = UIStackView(arrangedSubviews: [color0, color1, color2, color3, color4, color5, color6])
        colorsStackView.distribution = .fillEqually
        colorsStackView.spacing = 13
        
//        view.addSubview(smallDaysStackView)
        view.addSubview(colorsStackView)
        
        titleTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,right: view.rightAnchor, paddingTop: 70, paddingLeft: horPadding, paddingRight: horPadding)
        
        titleTextField.setHeight(40)
        
        daysNumberPickerView.anchor(top: titleTextField.bottomAnchor, left: view.leftAnchor, paddingTop: bigSpacing, paddingLeft: horPadding)
        daysNumberPickerView.setDimensions(height: 60, width: 120)
        
        categorizedDaysPickerView.anchor(top: titleTextField.bottomAnchor, left: daysNumberPickerView.rightAnchor, paddingTop: bigSpacing, paddingLeft: 20)
        categorizedDaysPickerView.setDimensions(height: 60, width: 120)
        
//        smallDaysStackView.anchor(top: daysNumberPickerView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: smallSpacing, paddingLeft: horPadding, paddingRight: horPadding)
//        smallDaysStackView.setHeight(30)
        daysView.anchor(top: daysNumberPickerView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: smallSpacing, paddingLeft: horPadding, paddingRight: horPadding)
        daysView.setHeight(30)
        
        colorsStackView.anchor(top: daysView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing, paddingLeft: horPadding, paddingRight: horPadding)
        colorsStackView.setHeight(30)
        
        
        goalPeriodTF.anchor(top: colorsStackView.bottomAnchor, left: view.leftAnchor, paddingTop: bigSpacing, paddingLeft: horPadding)
        goalPeriodTF.setDimensions(height: 30, width: 40)
        
        daysLabel.anchor(top: colorsStackView.bottomAnchor, left: goalPeriodTF.rightAnchor, paddingTop: bigSpacing, paddingLeft: 10)
        daysLabel.setDimensions(height: 30, width: 15)
        
        infiniteBox.anchor(top: colorsStackView.bottomAnchor, left: daysLabel.rightAnchor, paddingTop: bigSpacing, paddingLeft: 50)
        infiniteBox.setDimensions(height: 30, width: 30)
        
        infiniteLabel.anchor(top: colorsStackView.bottomAnchor, left: infiniteBox.rightAnchor,right: view.rightAnchor ,paddingTop: bigSpacing, paddingLeft: 15, paddingRight: 20)
        infiniteLabel.setHeight(30)
        
        goalStartDatePicker.anchor(top: goalPeriodTF.bottomAnchor, left: goalPeriodTF.leftAnchor, paddingTop: smallSpacing)
        goalStartDatePicker.setDimensions(height: 30, width: 115)
        
        goalEndDatePicker.anchor(top: goalPeriodTF.bottomAnchor, right: view.rightAnchor, paddingTop: smallSpacing, paddingRight: horPadding)
        goalEndDatePicker.setDimensions(height: 30, width: 115)
        
        tilde.anchor(top: goalPeriodTF.bottomAnchor, left: goalStartDatePicker.rightAnchor, right: goalEndDatePicker.leftAnchor, paddingTop: smallSpacing)
        tilde.setHeight(30)
        
        horizontalLine.anchor(top: tilde.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing)
        horizontalLine.setHeight(2)
        
        
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
        
        
        startTimePicker.anchor(top: goalDurationPre.bottomAnchor, left: titleTextField.leftAnchor, paddingTop: bigSpacing)
        startTimePicker.setDimensions(height: 30, width: 115)
        
        
        endTimePicker.anchor(top: goalDurationPre.bottomAnchor, right: titleTextField.rightAnchor, paddingTop: bigSpacing)
        endTimePicker.setDimensions(height: 30, width: 115)
        
        tilde2.anchor(top: goalDurationPre.bottomAnchor, left: startTimePicker.rightAnchor, right: endTimePicker.leftAnchor, paddingTop: bigSpacing)
        tilde2.setHeight(30)
        
        alarmTimePicker.anchor(top: startTimePicker.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: bigSpacing, paddingLeft: horPadding, paddingRight: horPadding)
        alarmTimePicker.setHeight(30)
        
        testButton.anchor(top: alarmTimePicker.bottomAnchor, left: view.leftAnchor, paddingTop: bigSpacing, paddingLeft: horPadding)
        testButton.setDimensions(height: 50, width: 50)
        
        
        let confirmStackView = UIStackView(arrangedSubviews: [nextButton, cancelButton])
        confirmStackView.spacing = 15
        confirmStackView.distribution = .fillEqually
        view.addSubview(confirmStackView)
        
        confirmStackView.anchor( left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 50, paddingBottom: 50, paddingRight: 50)
        confirmStackView.setHeight(35)
    }
}

extension AddHabitController2 : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == daysNumberPickerView {
            return daysNumberArray.count
        } else {
            return categorizedDaysDatas.count
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var pickerLabel = view as? UILabel;
        
        if (pickerLabel == nil)
        {
            pickerLabel = UILabel()
            
            pickerLabel?.font = UIFont.systemFont(ofSize: 16)
            pickerLabel?.textAlignment = .center
        }
        
        //daysNumberPickerView
        //categorizedDaysPickerView
        pickerLabel?.text = pickerView == daysNumberPickerView ?  daysNumberArray[row] : categorizedDaysDatas[row]
        return pickerLabel!
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == daysNumberPickerView {
            print("selectedRow: \(row) in daysNumberPickerView")
            if row == 1 {
                categorizedDaysPickerView.isHidden = true
                daysView.isHidden = true
            } else if row == 0 {
                categorizedDaysPickerView.isHidden = false
                daysView.isHidden = false
            }
            
        } else if pickerView == categorizedDaysPickerView {
            print("selectedRow: \(row)")
        }
    }
}

class DaysView: UIView {
    
    private lazy var mon = CustomButton(with: "월")
    private lazy var tue = CustomButton(with: "화")
    private lazy var wed = CustomButton(with: "수")
    private lazy var thu = CustomButton(with: "목")
    private lazy var fri = CustomButton(with: "금")
    private lazy var sat = CustomButton(with: "토")
    private lazy var sun = CustomButton(with: "일")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
//        backgroundColor = .magenta
        let stackView = UIStackView(arrangedSubviews: [mon, tue, wed, thu, fri, sat, sun])
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        addSubview(stackView)
        stackView.fillSuperview()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ColorsView: UIView {
    
    private let color0 = ColorButton(hexcolor: "#FF0000", tagInt: 0)
    private let color1 = ColorButton(hexcolor: "#00FF00", tagInt: 1)
    private let color2 = ColorButton(hexcolor: "#0000FF", tagInt: 2)
    private let color3 = ColorButton(hexcolor: "#FFFF00", tagInt: 3)
    private let color4 = ColorButton(hexcolor: "#FF00FF", tagInt: 4)
    private let color5 = ColorButton(hexcolor: "#00FFFF", tagInt: 5)
    private let color6 = ColorButton(hexcolor: "#151323", tagInt: 6)
    private let color7 = ColorButton(hexcolor: "#848513", tagInt: 7)
    private let color8 = ColorButton(hexcolor: "#884165", tagInt: 8)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        let colorsStackView = UIStackView(arrangedSubviews: [color0, color1, color2, color3, color4, color5, color6])
        colorsStackView.distribution = .fillEqually
        colorsStackView.spacing = 13
        
        addSubview(colorsStackView)
        colorsStackView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
