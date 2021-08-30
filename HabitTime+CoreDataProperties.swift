//
//  HabitTime+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/08/31.
//
//

import Foundation
import CoreData


extension HabitTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HabitTime> {
        return NSFetchRequest<HabitTime>(entityName: "HabitTime")
    }

    @NSManaged public var startTime: Date?
    @NSManaged public var endTime: Date?
    @NSManaged public var habit: Habit?

}
