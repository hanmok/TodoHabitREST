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
    
    private let getOneBtn: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(getOneBtnPressed), for: .touchUpInside)
        button.setTitle("getOne", for: .normal)
        button.setTitleColor(.magenta, for: .normal)
        return button
    }()
    
    private let getAllBtn: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(getAllBtnPressed), for: .touchUpInside)
        button.setTitle("getAll", for: .normal)
        button.setTitleColor(.magenta, for: .normal)
        return button
    }()
    
    
    
    private let postBtn: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(postBtnPressed), for: .touchUpInside)
        button.setTitle("post", for: .normal)
        button.setTitleColor(.cyan, for: .normal)
        return button
    }()
    
    private let deleteAllBtn: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(deleteAllPressed), for: .touchUpInside)
        button.setTitle("deleteAll", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    private let deleteOneBtn: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(deleteOnePressed), for: .touchUpInside)
        button.setTitle("deleteOne", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    
    
    private let patchBtn: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(patchBtnPressed), for: .touchUpInside)
        button.setTitle("patch", for: .normal)
        button.setTitleColor(.green, for: .normal)
        return button
    }()
    
    // works
    @objc func getOneBtnPressed() {
        getOne()
    }
    
    @objc func getAllBtnPressed() {
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
                self.todos = try JSONDecoder().decode([Todo2].self, from: newData!.data(using: .utf8)!)
            } catch {
                print("failed to decode!")
            }
            print("todo: \(self.todos)")
            print("count :\(self.todos.count)")
        }
    }
    
    func getOne() {
        AF.request("http://localhost:5000/todos/614b423a799255beccc10a40").response { response in
            let newData = String(data: response.data!, encoding: .utf8)
            
            do {
                let newTodo = try JSONDecoder().decode(Todo2.self, from: newData!.data(using: .utf8)!)
//                self.todos.append(newTodo)
                self.todos.append(newTodo)
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
    
    @objc func postBtnPressed() {
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
        
        // test 6
//        Service.shared.testPostCode()
    }
    
    @objc func deleteAllPressed() {
        print("deleteAllPressed")
//        Service.shared.deleteMethod()
        Service.shared.deleteAllTodos() // working
//        Service.shared.deleteTodosAF() // throw error but it works .. what..?
    }
    
    @objc func patchBtnPressed() {
        print("patch pressed !")
        Service.shared.patchOne(id: "61487bd1f00a038096df4f69", newTitle: "this is new title!", newOnDate: "new Date !!")
    }
    
    @objc func deleteOnePressed() {
        print("deleteOnePressed")
        Service.shared.deleteOne(id: "614b423d799255beccc10a42") { error in
            if error != nil {
                print("error occured! \(error)")
            } else {
                print("successfully deleted on item !")
            }
        }
    }
    
    override func viewDidLoad() {
        
        let getStackView = UIStackView(arrangedSubviews: [getOneBtn, getAllBtn])
        getStackView.axis = .horizontal
        getStackView.spacing = 20
        getStackView.distribution = .fillEqually
        
        let deleteStackView = UIStackView(arrangedSubviews: [deleteOneBtn, deleteAllBtn])
        deleteStackView.axis = .horizontal
        deleteStackView.spacing = 20
        deleteStackView.distribution = .fillEqually
        
        
        
        let stackView = UIStackView(arrangedSubviews: [getStackView, postBtn, deleteStackView, patchBtn])
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        
        
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
    }
    
    
}
