//
//  CalenderController.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/27.
//

import UIKit

class CalendarController: UIViewController {
    
    let calendarView : CalendarView = {
        let view = CalendarView(theme: MyTheme.dark)
        view.layer.cornerRadius = 10 // doesn't work as I expeted..
        
        return view
    }()
    
    var theme = MyTheme.dark

    private let topView : UIView = {
        let view = UIView()
        view.backgroundColor = Colors.darkGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.view.backgroundColor = Style.bgColor
        self.view.backgroundColor = .white
        
        view.addSubview(topView)
        topView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor)
        topView.setHeight(50)
        view.addSubview(calendarView)
        calendarView.anchor(top: topView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: -45)
        calendarView.setHeight(300)
        
        
    }
    
     func changeTheme() {
        if theme == .dark {
            theme = .light
            Style.themeLight()
        } else {
            theme = .dark
            Style.themeDark()
        }
        self.view.backgroundColor = Style.bgColor
        calendarView.changeTheme()
    }
}
