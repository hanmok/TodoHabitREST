//
//  AchievedDates+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/09/10.
//
//

import Foundation
import CoreData


extension AchievedDates {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AchievedDates> {
        return NSFetchRequest<AchievedDates>(entityName: "AchievedDates")
    }

    @NSManaged public var yearMonth: Int64
    @NSManaged public var dates: Data?
    @NSManaged public var habit: Habit?
    @NSManaged public var negativeHabit: NegativeHabit?

}
