//
//  NegativeGoal+CoreDataProperties.swift
//  
//
//  Created by Mac mini on 2021/08/31.
//
//

import Foundation
import CoreData


extension NegativeGoal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NegativeGoal> {
        return NSFetchRequest<NegativeGoal>(entityName: "NegativeGoal")
    }

    @NSManaged public var goalRep: Int64
    @NSManaged public var goalTime: Int64
    @NSManaged public var negativeHabit: NegativeHabit?

}
