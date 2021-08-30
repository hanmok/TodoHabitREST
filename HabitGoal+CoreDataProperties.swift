//
//  HabitGoal+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/08/31.
//
//

import Foundation
import CoreData


extension HabitGoal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HabitGoal> {
        return NSFetchRequest<HabitGoal>(entityName: "HabitGoal")
    }

    @NSManaged public var goalTime: Int64
    @NSManaged public var goalRep: Int64
    @NSManaged public var habit: Habit?

}
