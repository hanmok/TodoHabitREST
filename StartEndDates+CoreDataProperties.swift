//
//  StartEndDates+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/09/10.
//
//

import Foundation
import CoreData


extension StartEndDates {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StartEndDates> {
        return NSFetchRequest<StartEndDates>(entityName: "StartEndDates")
    }

    @NSManaged public var createdAt: Int64
    @NSManaged public var endAt: Int64
    @NSManaged public var datesDuration: Int64
    @NSManaged public var habit: Habit?
    @NSManaged public var negativeHabit: NegativeHabit?

}
