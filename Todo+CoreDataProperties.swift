//
//  Todo+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/08/31.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var date: Date?
    @NSManaged public var isDone: Bool
    @NSManaged public var title: String?
    @NSManaged public var goalDuration: Int64
    @NSManaged public var onDate: Date?
    @NSManaged public var alarm: TodoAlarm?
    @NSManaged public var time: TodoTime?

}
