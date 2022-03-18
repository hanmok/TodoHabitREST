//
//  TodoView.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/27.
//

import UIKit
import CoreData

class TodoView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    var todos: [Todo]? {
        didSet {
            self.myTableView.reloadData()
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private let myTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.separatorColor = .clear
        tableView.rowHeight = 50
        return tableView
    }()
    
    // MARK: - Initial Setups
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeView()
        
    }
    
    func initializeView() {
        
        addSubview(myTableView)
        myTableView.fillSuperview()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(TodoTableCell.self, forCellReuseIdentifier: "todoTableCell")
        
        fetchTodos()
    }
    
    
    // MARK: - Todo CoreData Management
    func fetchTodos() {
        print("fetchTodos called from TodoView")
        do {
            let request = Todo.fetchRequest() as NSFetchRequest<Todo>
            
            self.todos = try context.fetch(request)
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        } catch {
            print("DEBUG : Error Occurred during fetching habits")
        }
    }
    
    func removeTodo(index: Int){
        
        let todoToRemove = self.todos![index]
        
        self.context.delete(todoToRemove)
        
        do {
            try self.context.save()
        } catch {
            print("Error during delete")
        }
        
        fetchTodos() // fetch and reload
    }
    
    
    // MARK: - UITableView Setup
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoTableCell", for: indexPath) as! TodoTableCell
        cell.todo = todos![indexPath.row]
//        cell.viewModel = TodoViewModel(todo: todos![indexPath.row])
        return cell
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension TodoView {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        guard let validTodos = todos else { return }
//        var todo = validTodos[indexPath.row]
        
//        todo.isDone.toggle()
        do {
            try self.context.save()
            print("trying toggle!")
        } catch {
            print("error during toggling isDone Property")
        }
        
        fetchTodos()
        
        myTableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        removeTodo(index: indexPath.row)
    }
    
}

extension TodoView {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "edit") { action, view, completionHandler in
            print("edit!")
            
            completionHandler(true)
        }
        let delete = UIContextualAction(style: .normal, title: "delete") { action, view, completionHandler in
            print("delete!")
//            self.removeTodo(index: indexPath.row)
            
            //            self.posts.remove(at: indexPath.row)
//                        self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
//            self.myTableView.deleteRows(at: [indexPath], with: .automatic)
            self.removeTodo(index: indexPath.row)
            completionHandler(true)
            
        }
        
        edit.backgroundColor = .clear
        delete.backgroundColor = .clear
        
        // reverse order
        return UISwipeActionsConfiguration(actions: [delete, edit])
    }
}


//override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//    if editingStyle == .delete {
//        print("Delete post")
//        let post = self.posts[indexPath.row]
//        Service.shared.deletePost(id: post.id) { err in
//            if let err = err {
//                print("Failed to delete", err)
//                return
//            }
//            self.posts.remove(at: indexPath.row)
//            self.tableView.deleteRows(at: [indexPath], with: .automatic)
//            print("Successfully deleted post from the server")
//        }
//    }
//}
