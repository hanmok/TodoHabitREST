//
//  SettingsController.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/25.
//

import UIKit
class SettingsController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .blue
        navigationController?.navigationBar.isHidden = true
        
        testCodes()
    }
    
    func testCodes() {
//        let calendar = NSCalendar.date(<#T##self: NSCalendar##NSCalendar#>)
        let calendar = NSCalendar.autoupdatingCurrent
        let calendar2 = NSCalendar.current
//        NSCalendar.
//        let calendar = NSCalendar.date(NSCalendar())
        let components = calendar.dateComponents([.year, .month, .day], from: Date())
        
        print("components : \(components)")
    }
}
