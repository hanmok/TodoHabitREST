//
//  TodoController.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/25.
//

import UIKit
import CoreData

private let todoreuseIdentifer = "todoCell"
private let footerIdentifier = "TodoFooter"
private let headerIdentifier = "TodoHeader"

class TodoController: UITableViewController {

    let testTodos = ["1", "2"]

    private var todos: [Todo]?

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    private let headerView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 400, height: 100))

    private let footerView: UIView = UIView.init(frame: CGRect(x: 0, y: 0, width: 400, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .green
        navigationController?.navigationBar.isHidden = true
        self.tableView.separatorColor = UIColor.clear
        headerView.backgroundColor = .cyan
//        self.tableView.tableHeaderView = headerView
//        footerView.backgroundColor = .magenta
//        self.tableView.tableFooterView = footerView
//        configureUI()
        self.tableView.rowHeight = 50
    }

    func configureUI() {
        tableView.backgroundColor = .white
        tableView.register(TodoCell.self, forCellReuseIdentifier: todoreuseIdentifer)
        tableView.register(TodoFooter.self, forHeaderFooterViewReuseIdentifier: footerIdentifier)
        tableView.register(TodoHeader.self, forHeaderFooterViewReuseIdentifier: headerIdentifier)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: todoreuseIdentifer, for: indexPath) as! TodoCell
//        cell.viewModel = TodoViewModel(todo: todos![indexPath.row])

//        cell.todoCell = todos![indexPath.row]
        cell.testCellText = testTodos[indexPath.row]
        print("testTodos: \(testTodos)")
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return todos?.count ?? 0
        return testTodos.count
    }

    func fetchTodos() {
        do {
            let request = Todo.fetchRequest() as NSFetchRequest<Todo>

//            let sort = NSSortDescriptor(key: "createdAt", ascending: true)
//            let pred = NSPredicate(format: "onDate CONTAINS %@", arguments: today) // do it later.
//            let pred = NSPredicate(format: "onDate CONTAINS %@", argumentArray: <#T##[Any]?#>)

//            request.sortDescriptors = [sort]

            self.todos = try context.fetch(request)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("DEBUG : Error Occurred during fetching habits")
        }
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("hi")
    }
}



class TodoCell: UITableViewCell {


    private let containerView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 10
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.black.cgColor
        return v
    }()

    private let testLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    public var testCellText: String?

    var todoCell: Todo?

    var viewModel: TodoViewModel? {
        didSet { configure() }
    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "todoCell")
//        self.frame.width = 100
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 5, paddingRight: 20)

        containerView.addSubview(testLabel)
        testLabel.fillSuperview()

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        print("configure called")
//        containerView.backgroundColor = UIColor(white: 0.7, alpha: 0.8)
//        containerView.backgroundColor = .magenta
        testLabel.text = testCellText
//        testLabel.text = "asmdk"
        print("testLabel.text:\(testLabel.text)")
        testLabel.textColor = .black
    }
}

//struct TodoViewModel {
//    public var todo: Todo
//}

class TodoFooter: UITableViewHeaderFooterView {

}

class TodoHeader: UITableViewHeaderFooterView {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//    }
//    init() {
//        super.init()
//    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

