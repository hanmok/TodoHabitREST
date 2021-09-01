//
//  TodoTableCell.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/27.
//

import UIKit
import CoreData

class TodoTableCell: UITableViewCell {
    
    var todo: Todo? {
        didSet { configureUI() }
    }
    
    var viewModel: TodoViewModel? {
        didSet { configureUI() }
    }
    
    var containerView: UIView = {
        let v = UIView()
//        v.backgroundColor = .darkGray
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor(white: 0.5, alpha: 0.8).cgColor
        v.layer.cornerRadius = 15
        return v
    }()
    
    var todoLabel: UILabel = {
        let label = UILabel()
        label.text = "  todoLabel"
//        label.layer.borderWidth = 1
//        label.layer.borderColor = UIColor(white: 0.5, alpha: 0.8).cgColor
//        label.layer.cornerRadius = 15
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "todoTableCell")
        
        
        addSubview(containerView)
//        containerView.fillSuperview()
        containerView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5)
        
        
        containerView.addSubview(todoLabel)
        todoLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 12)
        
        configureUI()
    }
    
    func configureUI() {
        guard let validTodo = todo  else { return }
        todoLabel.text = validTodo.title
        
        guard let viewModel = viewModel else { return }
        containerView.backgroundColor = viewModel.containerColor
        todoLabel.textColor = viewModel.labelColor

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5))
    }
}
