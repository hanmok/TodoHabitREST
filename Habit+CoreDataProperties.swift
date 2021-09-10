//
//  Habit+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/09/10.
//
//

import Foundation
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var title: String?
    @NSManaged public var onDates: Data?
    @NSManaged public var color: String?
    @NSManaged public var habitAlarm: Alarm?
    @NSManaged public var habitGoal: Goal?
    @NSManaged public var habitDates: StartEndDates?
    @NSManaged public var habitTime: OnTime?
    @NSManaged public var habitAchievedDates: AchievedDates?

}
