//
//  APITestViewController.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/09/17.
//

import UIKit
import Alamofire

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
    }
    
    // this is working..
    func fetchTodos() {
        // working code
//        Service.shared.getTodos { result in
//            switch result {
//            case .failure(let error):
//                print("error :\(error)")
//            case .success(let todos):
//                self.todos = todos
//            }
//        }
        //
//        print("todo : \(todos)")
        
        // it works !!
        AF.request("http://localhost:5000/todos").response { response in
            let newData = String(data: response.data!, encoding: .utf8)
            
            do {
                try self.todos = try JSONDecoder().decode([Todo2].self, from: newData!.data(using: .utf8)!)
            } catch {
                print("failed to decode!")
            }
            print("todo: \(self.todos)")
            print("count :\(self.todos.count)")
        }
    }
    
    // this is not working. 
    func fetchTodos2() {
        
    }
    
    @objc func button2Pressed() {
        print("button2 pressed")
        // test 1
//        Service.shared.createPost(title: "testFromSwift", onDate: "dateFromSwift") { error in
//            if error != nil {
//                print("error ! :\(String(describing: error))")
//            } else {
//                print("sucessfully postsed !")
//            }
//        }
        
        // test 2
//        Service.shared.fromStack()
        
        // test 3
//        Service.shared.requestPost { bool in
//            bool ? print("success!") : print("fail!")
//        }

        // test 4
        // works
        Service.shared.postTodoAF(onDate: "testOnDateSwift2", title: "testTitleSwift2")
        
        // test 5
        
//        Service.shared.createPost2(title: "5th test title", onDate: "th test onDate") { error in
//            if error != nil {
//                print("error!")
//            } else {
//                print("success!")
//            }
//        }
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
