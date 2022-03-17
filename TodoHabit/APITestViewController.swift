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
    var todo = Todo()
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
    
    
    // MARK: - Actions
    
    @objc func getOneBtnPressed() {
        getOneTodo()
    }
    
    @objc func getAllBtnPressed() {
        getAllTodos()
    }
    
    @objc func postBtnPressed() {
        postOneTodo()
    }
    
    
    @objc func deleteOnePressed() {
        deleteOneTodo()
    }
    
    @objc func deleteAllPressed() {
        deleteAllTodos()
        
    }
    
    @objc func patchBtnPressed() {
        patchOneTodo()
    }
    
    // MARK: - Helpers
    
    func getOneTodo() {
        AF.request("http://localhost:5001/todos/614b423a799255beccc10a40").response { response in
            let newData = String(data: response.data!, encoding: .utf8)
            
            do {
                let newTodo = try JSONDecoder().decode(Todo2.self, from: newData!.data(using: .utf8)!)
                //                self.todos.append(newTodo)
//                self.todos.append(newTodo)
                print("newTodo : \(newTodo)")
            } catch {
                print("failed to decode!")
            }
//            print("todo: \(self.todos)")
//            print("count :\(self.todos.count)")
        }
    }
    
    // this is working..
    func getAllTodos() {
        
        // it works !!
        AF.request("http://localhost:5001/todos").response { response in
            let newData = String(data: response.data!, encoding: .utf8)
            
            do {
                self.todos = try JSONDecoder().decode([Todo2].self, from: newData!.data(using: .utf8)!)
            } catch {
                print("failed to decode!")
            }
            print("todo: \(self.todos)")
            print("todoCount :\(self.todos.count)")
        }
    }
    
    
    func postOneTodo() {
        Service.shared.postTodoAF(onDate: "testOnDateSwift4", title: "testTitleSwift44")
    }

    
    func deleteOneTodo() {
        Service.shared.deleteOneTodo(id: "614b4fac5b7fb541813e79ec")
    }
    
    func deleteAllTodos() {

        Service.shared.deleteTodosAF()
    }
    
    func patchOneTodo() {
        Service.shared.patchOne(id: "614b4bf15b7fb541813e79b7", newTitle: "this is new title From Swift!", newOnDate: "new Date From Swift!!")
    }
    
    
    func configureUI() {
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
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        configureUI()
        
    }
}
