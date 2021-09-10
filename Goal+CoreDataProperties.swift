//
//  Goal+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/09/10.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var goalDuration: Int64
    @NSManaged public var goalRep: Int64
    @NSManaged public var habit: Habit?
    @NSManaged public var negativeHabit: NegativeHabit?
    @NSManaged public var todo: Todo?

}
