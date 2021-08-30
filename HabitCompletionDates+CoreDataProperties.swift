//
//  HabitCompletionDates+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/08/31.
//
//

import Foundation
import CoreData


extension HabitCompletionDates {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HabitCompletionDates> {
        return NSFetchRequest<HabitCompletionDates>(entityName: "HabitCompletionDates")
    }

    @NSManaged public var yearMonth: Date?
    @NSManaged public var doneDates: [Int]?
    @NSManaged public var habit: Habit?

}
