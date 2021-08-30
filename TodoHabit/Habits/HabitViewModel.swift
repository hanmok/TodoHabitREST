//
//  HabitViewModel.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/25.
//
import UIKit
import CoreData

struct HabitViewModel {
    public var habit: Habit
    
//    var title: NSMutableString { return }
    var titleLabel: NSMutableAttributedString { return NSMutableAttributedString(string: habit.title!, attributes: [.font : UIFont.systemFont(ofSize: 15)])
        
    }
}
