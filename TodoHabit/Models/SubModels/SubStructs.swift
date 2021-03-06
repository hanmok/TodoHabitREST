//
//  SubStructs.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/09/11.
//

import Foundation

struct AchievedDates2 {
    let yearMonth: Int
    let dates: [Int]
}

struct Alarm2: Decodable{
    let isAlarmOn: Bool
    let alarmTime: Date
}

struct StartEndDates2 {
    let createdAt: Int
    let datesDuration: Int?
    let endAt: Int?
}

struct Goal2: Decodable {
    let goalDuration: Int
    let goalRep: Int
}

struct OnTime2: Decodable {
    let endsAt: String
    let startsAt: String
}
