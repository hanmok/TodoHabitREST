//
//  NegativeCompletionDates+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/08/31.
//
//

import Foundation
import CoreData


extension NegativeCompletionDates {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NegativeCompletionDates> {
        return NSFetchRequest<NegativeCompletionDates>(entityName: "NegativeCompletionDates")
    }

    @NSManaged public var yearMonth: Date?
    @NSManaged public var doneDates: [Int]?
    @NSManaged public var howLong: Dictionary<Int:Date>?
    @NSManaged public var howMany: Dictionary<Int:Int>?
    @NSManaged public var negativeHabit: NegativeHabit?

}
