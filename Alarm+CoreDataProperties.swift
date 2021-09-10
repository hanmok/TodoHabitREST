//
//  Alarm+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/09/10.
//
//

import Foundation
import CoreData


extension Alarm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alarm> {
        return NSFetchRequest<Alarm>(entityName: "Alarm")
    }

    @NSManaged public var isAlarmOn: Bool
    @NSManaged public var alarmTime: Date?
    @NSManaged public var habit: Habit?
    @NSManaged public var todo: Todo?

}
