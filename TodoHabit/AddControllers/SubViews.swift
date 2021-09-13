//
//  SubViews.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/09/12.
//

import UIKit


class DaysView: UIView {
    
    var checkedDays = Set<Int>() // initialize empty set of type Int
    private let daysNumberPickerView = UIPickerView()
    private let daysNumberArray = ["요일 선택", "주당 횟수 선택"]
    
    private let categorizedDaysPickerView = UIPickerView()
    private let categorizedDaysDatas = ["주중", "매일", "주말", "선택"]
    
    
    public let daysStackView : UIStackView = {
        var mon = CustomButton(with: "월", 0)
        var tue = CustomButton(with: "화", 1)
        var wed = CustomButton(with: "수", 2)
        var thu = CustomButton(with: "목", 3)
        var fri = CustomButton(with: "금", 4)
        var sat = CustomButton(with: "토", 5)
        var sun = CustomButton(with: "일", 6)
        
        let days = [mon, tue, wed, thu, fri, sat, sun]
        for eachDay in days {
            eachDay.addTarget(self, action: #selector(dayPressed), for: .touchUpInside)
        }
        let stackView = UIStackView(arrangedSubviews: [mon, tue, wed, thu, fri, sat, sun])
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    @objc func dayPressed(_ sender: UIButton) {
        print("\(sender.tag)")
        
        sender.isSelected.toggle()
        if sender.isSelected {
            sender.backgroundColor = .magenta
            checkedDays.insert(sender.tag)
        } else {
            sender.backgroundColor = customButtonColor
            checkedDays.remove(sender.tag)
        }
    }
    
    //    public let monToSunDays = MonToSunDays()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        addSubview(daysNumberPickerView)
        daysNumberPickerView.delegate = self
        daysNumberPickerView.dataSource = self
        
        addSubview(categorizedDaysPickerView)
        categorizedDaysPickerView.delegate = self
        categorizedDaysPickerView.dataSource = self
        
        daysNumberPickerView.anchor(top: topAnchor, left: leftAnchor, paddingLeft: horPadding)
        daysNumberPickerView.setDimensions(height: 50, width: 120)
        
        categorizedDaysPickerView.anchor(top: topAnchor, left: daysNumberPickerView.rightAnchor, paddingLeft: 20)
        categorizedDaysPickerView.setDimensions(height: 50, width: 120)
        
        addSubview(daysStackView)
        daysStackView.anchor(top: daysNumberPickerView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: smallSpacing, paddingLeft: horPadding, paddingRight: horPadding)
        daysStackView.setHeight(30)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// 주 n 회 선택하는 화면 요일선택 아래 만들기. 
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
                daysStackView.isHidden = true
                //                daysView.isHidden = true
            } else if row == 0 {
                categorizedDaysPickerView.isHidden = false
                daysStackView.isHidden = false
                //                daysView.isHidden = false
            }
            
        } else if pickerView == categorizedDaysPickerView {
            print("selectedRow: \(row)") // 0: 주중, 1: 매일, 2: 주말, 3: 선택
        }
    }
}


// add something to checked color . 
// make it collectionView and circular ! or square with corner radius
class ColorsView: UIView {
    
    public var pickedColor: String = "#151323"
    
let colorDatas = [ "FF0000", "00FF00",  "0000FF", "FFFF00", "FF00FF", "00FFFF", "151323" ]
    
    private let colorsStackView : UIStackView = {
         let color0 = ColorButton(hexcolor: "#FF0000", tagInt: 0)
         let color1 = ColorButton(hexcolor: "#00FF00", tagInt: 1)
         let color2 = ColorButton(hexcolor: "#0000FF", tagInt: 2)
         let color3 = ColorButton(hexcolor: "#FFFF00", tagInt: 3)
         let color4 = ColorButton(hexcolor: "#FF00FF", tagInt: 4)
         let color5 = ColorButton(hexcolor: "#00FFFF", tagInt: 5)
         let color6 = ColorButton(hexcolor: "#151323", tagInt: 6)
        
        let colors = [color0, color1, color2, color3, color4, color5, color6]
        for eachColor in colors {
            eachColor.addTarget(self, action: #selector(colorPressed), for: .touchUpInside)
        }
        let stackView = UIStackView(arrangedSubviews: [color0, color1, color2, color3, color4, color5, color6])
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    @objc func colorPressed(_ sender: UIButton) {
        pickedColor = colorDatas[sender.tag]
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
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


