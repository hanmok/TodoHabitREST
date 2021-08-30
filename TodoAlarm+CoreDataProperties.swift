//
//  TodoAlarm+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/08/31.
//
//

import Foundation
import CoreData


extension TodoAlarm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoAlarm> {
        return NSFetchRequest<TodoAlarm>(entityName: "TodoAlarm")
    }

    @NSManaged public var alarmAt: Date?
    @NSManaged public var alAlarmOn: Bool
    @NSManaged public var todo: Todo?

}
