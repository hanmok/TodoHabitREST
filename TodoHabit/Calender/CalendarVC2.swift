//
//  CalendarVC2.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/27.
//

import UIKit
import FSCalendar

class CalendarVC2: UIViewController {

    var calendarView : FSCalendar = {
        let view = FSCalendar()
//        view.scrollDirection = .vertical
        view.scrollDirection = .horizontal
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calendarView)
        calendarView.fillSuperview()
    }
}
