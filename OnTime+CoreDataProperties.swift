//
//  OnTime+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/09/10.
//
//

import Foundation
import CoreData


extension OnTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<OnTime> {
        return NSFetchRequest<OnTime>(entityName: "OnTime")
    }

    @NSManaged public var startsAt: String?
    @NSManaged public var endsAt: String?
    @NSManaged public var habit: Habit?
    @NSManaged public var todo: Todo?

}
