//
//  NegativeDate+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/08/31.
//
//

import Foundation
import CoreData


extension NegativeDate {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NegativeDate> {
        return NSFetchRequest<NegativeDate>(entityName: "NegativeDate")
    }

    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var negativeHabit: NegativeHabit?

}
