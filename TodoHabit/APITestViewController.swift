//
//  APITestViewController.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/09/17.
//

import UIKit

class APITestViewController: UIViewController {
    //    let service = Service()
    var todos: [Todo2] = []
    
    private let button1: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        button.setTitle("button1", for: .normal)
        button.setTitleColor(.magenta, for: .normal)
        return button
    }()
    
    private let button2: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(button2Pressed), for: .touchUpInside)
        button.setTitle("button2", for: .normal)
        button.setTitleColor(.cyan, for: .normal)
        return button
    }()
    
    @objc func button1Pressed() {
        fetchTodos()
//        Service.shared.requestGet(url: <#T##String#>, completionHandler: <#T##(Bool, Any) -> Void#>)
        
    }
    // this is working..
    func fetchTodos() {
        Service.shared.fetchTodos { result in
            switch result {
            case .failure(let error):
                print("error :\(error)")
            case .success(let todos):
                self.todos = todos
            }
        }
        print("todo : \(todos)")
    }
    // this is not working. 
    func fetchTodos2() {
        Service.shared.requestGet { success, data in
            if success {
print("data : \(data)")
            }
        }
    }
    
    @objc func button2Pressed() {
    }
    
    
    
    override func viewDidLoad() {
        
        view.addSubview(button1)
        view.addSubview(button2)
        
        button1.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        button1.setHeight(50)
        
        button2.anchor(top: button1.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 100)
        button2.setHeight(50)
        
        
    }
    
    
}
