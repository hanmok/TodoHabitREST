//
//  TodoMainController.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/27.
//

import UIKit
import CoreData

//protocol TodoMainControllerDelegate: AnyObject {
//    func mainControllerToView()
//}

class TodoMainController: UIViewController {
    
    let addTodoVC = AddTodoViewController()
//    weak var delegate: TodoMainControllerDelegate?
    
    private let viewSizeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.isHidden = true
        return view
    }()
    
    var todos: [Todo]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let todoTableView : TodoView = {
        let todoView = TodoView()
        
        return todoView
    }()
    
    private lazy var addTodoButton: UIButton = {
        let button = UIButton()
        
        let image = UIImage(systemName: "plus.circle.fill")
        image?.withTintColor(.black, renderingMode: .automatic)
        button.setBackgroundImage(image, for: .normal)
        
        button.addTarget(self, action: #selector(addPressed), for: .touchUpInside)
        return button
    }()
    
    func fetchTodos() {
        do {
            let request = Todo.fetchRequest() as NSFetchRequest<Todo>

            self.todos = try context.fetch(request)

        } catch {
            print("DEBUG : Error Occurred during fetching habits")
        }
    }
    
    @objc func addPressed() {
//
//        fetchTodos()
//
//        let newTodo = Todo(context: self.context)
//        newTodo.date = Date()
//        newTodo.isDone = false
//
//        guard let validTodos = todos else { return }
//        newTodo.title = "test \(validTodos.count)"
//
//        do {
//            try self.context.save()
//        } catch {
//            print("err : \(error)")
//        }
//
//        todoTableView.fetchTodos()
//        print("add button pressed")
        
        print("addPressed!")
        addTodoVC.delegate = self
        addChild(addTodoVC)
        addTodoVC.view.layer.cornerRadius = 20
        view.addSubview(addTodoVC.view)
//        addTodoVC.view.centerX(inView: view)
        addTodoVC.view.center(inView: view)
        addTodoVC.view.setDimensions(height: 180, width: view.frame.width - 100)
        addTodoVC.didMove(toParent: self)
//        view.backgroundColor = UIColor(white: 0.8, alpha: 0.9)
        viewSizeView.isHidden = false

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        configureUI()
    }
    
    func configureUI() {
        
        
        view.addSubview(todoTableView)
        todoTableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor, paddingTop: 50, paddingLeft: 50,paddingBottom: 100 ,paddingRight: 50)
        
        
        view.addSubview(addTodoButton)
        addTodoButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 50, paddingRight: 20)
        addTodoButton.setDimensions(height: 50, width: 50)
        
        view.addSubview(viewSizeView)
        viewSizeView.fillSuperview()
    }
    
    
    
    
}

extension TodoMainController : AddTodoViewControllerDelegate {
    
    func addTodo(title: String) {
        let newTodo = Todo(context: self.context)
        newTodo.date = Date()
        newTodo.isDone = false
        newTodo.title = title
        
        do {
            try self.context.save()
        } catch {
            print("err : \(error)")
        }
        
        todoTableView.fetchTodos()
//        view.backgroundColor = .white
        viewSizeView.isHidden = true
    }
    
    func cancelAdd() {
        viewSizeView.isHidden = true
    }
}
