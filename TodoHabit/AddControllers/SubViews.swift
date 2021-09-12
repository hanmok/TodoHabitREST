//
//  SubViews.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/09/12.
//

import UIKit

// make it collectionView.
class MonToSunDays: UIView {
    
    private lazy var mon = CustomButton(with: "월")
    private lazy var tue = CustomButton(with: "화")
    private lazy var wed = CustomButton(with: "수")
    private lazy var thu = CustomButton(with: "목")
    private lazy var fri = CustomButton(with: "금")
    private lazy var sat = CustomButton(with: "토")
    private lazy var sun = CustomButton(with: "일")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
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

class DaysView: UIView {
    
    private let daysNumberPickerView = UIPickerView()
    private let daysNumberArray = ["요일 선택", "주당 횟수 선택"]
    
    private let categorizedDaysPickerView = UIPickerView()
    private let categorizedDaysDatas = ["주중", "매일", "주말", "선택"]
    
    private let monToSunDays = MonToSunDays()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(daysNumberPickerView)
        daysNumberPickerView.delegate = self
        daysNumberPickerView.dataSource = self
        
        addSubview(categorizedDaysPickerView)
        categorizedDaysPickerView.delegate = self
        categorizedDaysPickerView.dataSource = self
        
        addSubview(monToSunDays)
        
        daysNumberPickerView.anchor(top: topAnchor, left: leftAnchor, paddingLeft: horPadding)
        daysNumberPickerView.setDimensions(height: 50, width: 120)
        
        categorizedDaysPickerView.anchor(top: topAnchor, left: daysNumberPickerView.rightAnchor, paddingLeft: 20)
        categorizedDaysPickerView.setDimensions(height: 50, width: 120)
        
        monToSunDays.anchor(top: daysNumberPickerView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: smallSpacing, paddingLeft: horPadding, paddingRight: horPadding)
        monToSunDays.setHeight(30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DaysView: UIPickerViewDelegate, UIPickerViewDataSource {
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
                //                daysView.isHidden = true
            } else if row == 0 {
                categorizedDaysPickerView.isHidden = false
                //                daysView.isHidden = false
            }
            
        } else if pickerView == categorizedDaysPickerView {
            print("selectedRow: \(row)")
        }
    }
}



// make it collectionView and circular ! or square with corner radius
class ColorsView: UIView {
    // 음.. Custom View 에서 만들어야하나 ? 아니면 AddController 내에서 만들어야하나 ?
//    private let collectionView : UICollectionView = {
//
//    }
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

        colorsStackView.anchor(top: topAnchor, left: leftAnchor,bottom: bottomAnchor, right: rightAnchor,  paddingLeft: horPadding, paddingRight: horPadding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GoalDurationDatesView: UIView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(goalPeriodTF)
        addSubview(daysLabel)
        addSubview(infiniteBox)
        addSubview(infiniteLabel)
        addSubview(goalStartDatePicker)
        addSubview(goalEndDatePicker)
        addSubview(tilde)
        
        goalPeriodTF.anchor(top: topAnchor, left: leftAnchor, paddingLeft: horPadding)
        goalPeriodTF.setDimensions(height: 30, width: 40)
        
        daysLabel.anchor(top: topAnchor, left: goalPeriodTF.rightAnchor, paddingLeft: 10)
        daysLabel.setDimensions(height: 30, width: 15)
        
        infiniteBox.anchor(top: topAnchor, left: daysLabel.rightAnchor, paddingLeft: 50)
        infiniteBox.setDimensions(height: 30, width: 30)
        
        infiniteLabel.anchor(top: topAnchor, left: infiniteBox.rightAnchor,right: rightAnchor , paddingLeft: 15, paddingRight: 20)
        infiniteLabel.setHeight(30)
        
        
        goalStartDatePicker.anchor(top: goalPeriodTF.bottomAnchor, left: goalPeriodTF.leftAnchor, paddingTop: smallSpacing)
        goalStartDatePicker.setDimensions(height: 30, width: 115)
        
        goalEndDatePicker.anchor(top: goalPeriodTF.bottomAnchor, right: rightAnchor, paddingTop: smallSpacing, paddingRight: horPadding)
        goalEndDatePicker.setDimensions(height: 30, width: 115)
        
        tilde.anchor(top: goalPeriodTF.bottomAnchor, left: goalStartDatePicker.rightAnchor, right: goalEndDatePicker.leftAnchor, paddingTop: smallSpacing)
        tilde.setHeight(30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class GoalView: UIView {
    
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
    
//    private let goalDurationTF : InputTextView = {
//        let tv = InputTextView()
//        tv.placeholderText = "0"
//        tv.font = UIFont.systemFont(ofSize: 15)
//        tv.isScrollEnabled = false
//        tv.placeholderShouldCenter = true
//        tv.textAlignment = .right
//        return tv
//    }()
    
    
    private let goalRepSuffix = CustomLabel(text: "회")
    private let goalDurationSuffix = CustomLabel(text: "분")
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addMultipleViews(views: [goalRepPre, goalDurationPre, goalRepTF, goalDurationTF, goalRepSuffix, goalDurationSuffix])
        
        
        goalRepPre.anchor(top: topAnchor, left: leftAnchor, paddingLeft: horPadding)
        goalRepPre.setDimensions(height: 30, width: 50)

        goalRepTF.anchor(top: topAnchor, left: goalRepPre.rightAnchor, paddingLeft: 10)
        goalRepTF.setDimensions(height: 30, width: 60)

        goalRepSuffix.anchor(top: topAnchor, left: goalRepTF.rightAnchor, paddingLeft: 10)
        goalRepSuffix.setDimensions(height: 30, width: 30)

        goalDurationPre.anchor(top: goalRepPre.bottomAnchor, left: leftAnchor, paddingTop: smallSpacing, paddingLeft: horPadding)
        goalDurationPre.setDimensions(height: 30, width: 50)

        goalDurationTF.anchor(top: goalRepPre.bottomAnchor, left: goalDurationPre.rightAnchor, paddingTop: smallSpacing, paddingLeft: 10)
        goalDurationTF.setDimensions(height: 30, width: 60)

        goalDurationSuffix.anchor(top: goalRepPre.bottomAnchor, left: goalDurationTF.rightAnchor, paddingTop: smallSpacing, paddingLeft: 10)
        goalDurationSuffix.setDimensions(height: 30, width: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class RoutineTimeView: UIView {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
//        backgroundColor = .magenta
        addMultipleViews(views: [startTimePicker, endTimePicker, tilde])
        
        startTimePicker.anchor(top: topAnchor, left: leftAnchor, paddingLeft: horPadding)
        startTimePicker.setDimensions(height: 30, width: 115)


        endTimePicker.anchor(top: topAnchor, right: rightAnchor, paddingRight: horPadding)
        endTimePicker.setDimensions(height: 30, width: 115)

        tilde.anchor(top: topAnchor, left: startTimePicker.rightAnchor, right: endTimePicker.leftAnchor)
        tilde.setHeight(30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


