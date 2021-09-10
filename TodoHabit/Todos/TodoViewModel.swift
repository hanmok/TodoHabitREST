//
//  TodoViewModel.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/27.
//

import UIKit
import CoreData

struct TodoColors {
//    static let shared = TodoColors()
    static let doneContainerColor = UIColor.blue
    static let notDoneContainerColor = UIColor.white
    
    static let doneLabelColor = UIColor.white
    static let notDoneLabelColor = UIColor.black
}

struct TodoViewModel {
    public var todo: Todo
    
    var containerColor: UIColor {
//        return todo.isDone ? TodoColors.doneContainerColor : TodoColors.notDoneContainerColor
        return UIColor.red
    }
    
    var labelColor: UIColor {
        return UIColor.blue
//        return todo.isDone ? TodoColors.doneLabelColor : TodoColors.notDoneLabelColor
    }
}
