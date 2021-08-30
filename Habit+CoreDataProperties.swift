//
//  Habit+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/08/31.
//
//

import Foundation
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var goalPeriod: Int64
    @NSManaged public var onDates: [Int]?
    @NSManaged public var title: String?
    @NSManaged public var colorString: String?
    @NSManaged public var alarm: HabitAlarm?
    @NSManaged public var goal: HabitGoal?
    @NSManaged public var completionHistory: HabitCompletionDates?
    @NSManaged public var time: HabitTime?
    @NSManaged public var date: HabitDate?

}
