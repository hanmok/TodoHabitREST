//
//  NegativeHabit+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/08/31.
//
//

import Foundation
import CoreData


extension NegativeHabit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NegativeHabit> {
        return NSFetchRequest<NegativeHabit>(entityName: "NegativeHabit")
    }

    @NSManaged public var title: String?
    @NSManaged public var onDates: [Int]?
    @NSManaged public var colorString: String?
    @NSManaged public var completionHistory: NegativeCompletionDates?
    @NSManaged public var goal: NegativeGoal?
    @NSManaged public var date: NegativeDate?

}
