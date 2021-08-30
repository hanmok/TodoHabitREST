//
//  HabitDate+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/08/31.
//
//

import Foundation
import CoreData


extension HabitDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HabitDate> {
        return NSFetchRequest<HabitDate>(entityName: "HabitDate")
    }

    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var habit: Habit?

}
