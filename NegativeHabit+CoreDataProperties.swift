//
//  NegativeHabit+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/09/10.
//
//

import Foundation
import CoreData


extension NegativeHabit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NegativeHabit> {
        return NSFetchRequest<NegativeHabit>(entityName: "NegativeHabit")
    }

    @NSManaged public var title: String?
    @NSManaged public var color: String?
    @NSManaged public var onDates: Data?
    @NSManaged public var negativeGoal: Goal?
    @NSManaged public var negativeDates: StartEndDates?
    @NSManaged public var negativeAchieved: AchievedDates?

}
