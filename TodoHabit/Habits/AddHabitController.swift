//
//  AddHabitController.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/26.
//

import UIKit

protocol AddHabitDelegate: AnyObject {
    func addHabit(with title: String, dates: [Int], goal: Int)
}

class AddHabitController: UIViewController {
    
    weak var delegate: AddHabitDelegate?
    
    private let controllerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.text = "습관 만들기"
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "습관 이름 :"
        return label
    }()
    
    private let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "습관 이름을 입력해주세요"
//        tf.autocorrectionType =
        tf.autocorrectionType = .no
        return tf
    }()
    
    private let onDateLabel: UILabel = {
        let label = UILabel()
        label.text = "실행 요일 :"
        return label
    }()
    
    
    
    private let weekDays = CustomButton(with: "주중")
    private let weekends = CustomButton(with: "주말")
    private let everyday = CustomButton(with: "매일")
    private let selection = CustomButton(with: "선택")
    
//    private let weekDays : CustomButton = {
//        let button = CustomButton(with: "주중")
//        button.makeCornerRadius(circle: false)
//        button.backgroundColor = UIColor(white: 0.7, alpha: 0.3)
//        return button
//    }()

//    private let mon = CustomButton(with: "mon")
//    private let tue = CustomButton(with: "tue")
//    private let wed = CustomButton(with: "wed")
//    private let thu = CustomButton(with: "thu")
//    private let fri = CustomButton(with: "fri")
//    private let sat = CustomButton(with: "sat")
//    private let sun = CustomButton(with: "sun")
    
    
    
    private let goalPeriodLabel: UILabel = {
        let label = UILabel()
        label.text = "목표 기간 :"
        return label
    }()
    
    private let goalPeriodTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "목표 기간을 입력해주세요 (일)"
//        tf.keyboardType = .numberPad
        tf.keyboardType = .decimalPad
        return tf
    }()
    
    private let goalDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11)
        label.text = "목표 기간 (일) 또는 종료 날짜를 입력해주세요 (2022.03.16)"
        label.numberOfLines = 2
        return label
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(white: 0.7, alpha: 0.3)
        button.makeCornerRadius(circle: false)
        button.addTarget(self, action: #selector(makeHabit), for: .touchUpInside)
        return button
    }()
    
    @objc func makeHabit() {
        print("makeHabit triggered")
        guard let title = titleTextField.text else { return }
        let dates = [1,2,3]
        guard let goalStr = goalPeriodTF.text else { return }
        guard let goalInt = Int(goalStr) else { return }
        print("what is wrong.. ? ")
        delegate?.addHabit(with: title, dates: dates, goal: goalInt)
        print("call delegate")
        self.dismiss(animated: true, completion: nil)
        print("dismissed")
    }
    
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
        view.addSubview(controllerLabel)
        view.addSubview(titleLabel)
        view.addSubview(titleTextField)

        view.addSubview(onDateLabel)

        view.addSubview(goalPeriodLabel)
        view.addSubview(goalPeriodTF)
        view.addSubview(goalDescriptionLabel)
        
//        view.addSubview(nextButton)
//        view.addSubview(cancelButton)
        
//        let stackView1 = UIStackView(arrangedSubviews: [titleLabel, onDateLabel])
//        stackView1.distribution = .fillEqually
//        stackView1.spacing = 10
//        stackView1.axis = .vertical
//        stackView1.backgroundColor = .green
        
        let bigDaysStackView = UIStackView(arrangedSubviews: [weekDays, weekends, everyday, selection])
        bigDaysStackView.distribution = .fillEqually
        bigDaysStackView.spacing = 2
//        bigDaysStackView.backgroundColor = .magenta
        
        // do it later
//        let smallDaysStackView = UIStackView(arrangedSubviews: [mon, tue, wed, thu, fri, sat, sun])
//        bigDaysStackView.distribution = .fillEqually
//        bigDaysStackView.spacing = 2
//        smallDaysStackView.backgroundColor = .cyan
        
        view.addSubview(bigDaysStackView)
//        let horizontalSpacing = 10
        let leftSize : CGFloat = 80
        let verticalSpacing: CGFloat = 15
        
        controllerLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
        controllerLabel.centerX(inView: view)
        controllerLabel.setDimensions(height: 40, width: 100)
        
        titleLabel.anchor(top: controllerLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 35, paddingLeft: 20)
        titleLabel.setDimensions(height: 40, width: leftSize)
//        titleLabel.backgroundColor = .magenta
        
        titleTextField.anchor(top: controllerLabel.bottomAnchor, left: titleLabel.rightAnchor, right: view.rightAnchor, paddingTop: 35, paddingLeft: 20, paddingRight: 20)
        titleTextField.setHeight(40)
        
        onDateLabel.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, paddingTop: verticalSpacing, paddingLeft: 20)
        onDateLabel.setDimensions(height: 40, width: leftSize)
        
        bigDaysStackView.anchor(top: titleTextField.bottomAnchor, left: onDateLabel.rightAnchor, right: view.rightAnchor, paddingTop: verticalSpacing, paddingLeft: 20, paddingRight: 20)
        bigDaysStackView.setHeight(40)
        
        goalPeriodLabel.anchor(top: onDateLabel.bottomAnchor, left: view.leftAnchor, paddingTop: verticalSpacing, paddingLeft: 20)
        goalPeriodLabel.setDimensions(height: 40, width: leftSize)
        
        goalPeriodTF.anchor(top: onDateLabel.bottomAnchor, left: goalPeriodLabel.rightAnchor, right: view.rightAnchor, paddingTop: verticalSpacing, paddingLeft: 20, paddingRight: 20)
        goalPeriodTF.setHeight(40)
        
        goalDescriptionLabel.anchor(top: goalPeriodTF.bottomAnchor, left: goalPeriodLabel.rightAnchor, right: view.rightAnchor, paddingLeft: 20, paddingRight: 20)
        
        let confirmStackView = UIStackView(arrangedSubviews: [nextButton, cancelButton])
        confirmStackView.spacing = 15
        confirmStackView.distribution = .fillEqually
        view.addSubview(confirmStackView)
        
        confirmStackView.anchor( left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 50, paddingBottom: 50, paddingRight: 50)
        confirmStackView.setHeight(35)

        
    }
    
}
