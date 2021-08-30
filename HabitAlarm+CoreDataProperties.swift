//
//  HabitAlarm+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/08/31.
//
//

import Foundation
import CoreData


extension HabitAlarm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HabitAlarm> {
        return NSFetchRequest<HabitAlarm>(entityName: "HabitAlarm")
    }

    @NSManaged public var isAlarmOn: Bool
    @NSManaged public var alarmAt: Date?
    @NSManaged public var habit: Habit?

}
