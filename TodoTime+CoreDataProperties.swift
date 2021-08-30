//
//  TodoTime+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/08/31.
//
//

import Foundation
import CoreData


extension TodoTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoTime> {
        return NSFetchRequest<TodoTime>(entityName: "TodoTime")
    }

    @NSManaged public var startTime: Date?
    @NSManaged public var endTime: Date?
    @NSManaged public var todo: Todo?

}
