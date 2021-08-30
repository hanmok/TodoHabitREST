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
    
    let enterTodoLabel: UILabel = {
        let label = UILabel()
        label.text = "Todo"
        label.textColor = .black
        label.textAlignment = .center
//        label.layer.cornerRadius = 20
//        label.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        label.backgroundColor = UIColor(white: 0.6, alpha: 0.9)
//        label.backgroundColor = .red
        return label
    }()
    
    let titleTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Todo 이름을 입력해주세요"
        tf.autocorrectionType = .no
        tf.textAlignment = .center
        return tf
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
        view.backgroundColor = UIColor(white: 0.8, alpha: 0.9)
        
        view.addSubview(enterTodoLabel)
        enterTodoLabel.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20)
        enterTodoLabel.setHeight(40)
        
        view.addSubview(titleTextField)
        titleTextField.anchor(top: enterTodoLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 15)
        titleTextField.setHeight(40)
        
        let confirmStackView = UIStackView(arrangedSubviews: [nextButton, cancelButton])
        confirmStackView.spacing = 15
        confirmStackView.distribution = .fillEqually
        view.addSubview(confirmStackView)
        
        confirmStackView.anchor( top: titleTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 20,  paddingRight: 20)
        confirmStackView.setHeight(40)
        
        
    }
}
