//
//  Todo+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/09/10.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var title: String?
    @NSManaged public var onDate: Date?
    @NSManaged public var todoGoal: Goal?
    @NSManaged public var todoTime: OnTime?
    @NSManaged public var todoAlarm: Alarm?

}
