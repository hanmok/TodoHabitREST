//
//  CalenderView.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/27.
//

import UIKit

enum MyTheme {
    case light
    case dark
}

struct Colors {
    static var darkGray = #colorLiteral(red: 0.3764705882, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
    static var darkRed = #colorLiteral(red: 0.5019607843, green: 0.1529411765, blue: 0.1764705882, alpha: 1)
}

struct Style {
    static var bgColor = UIColor.white
    static var monthViewLabelColor = UIColor.white
    static var monthViewButtonRightColor = UIColor.white
    static var monthViewButtonLeftColor = UIColor.white
    static var activeCellLabelColor = UIColor.white
    static var activeCellLabelColorHighlighted = UIColor.black
    static var weekdaysLabelColor = UIColor.white
    
    static func themeDark() {
        bgColor = .darkGray
        monthViewLabelColor = .white
        monthViewButtonLeftColor = .white
        monthViewButtonRightColor = .white
        activeCellLabelColor = .white
        activeCellLabelColorHighlighted = .black
        weekdaysLabelColor = .white
    }
    
    static func themeLight() {
        bgColor = .white
        monthViewLabelColor = .black
        monthViewButtonRightColor = .black
        monthViewButtonLeftColor = .black
        activeCellLabelColor = .black
        activeCellLabelColorHighlighted = .white
        weekdaysLabelColor = .black
    }
}



class CalendarView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CalendarViewCellDelegate {
    func cellPressed() {
        print("cell pressed from calendarView")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfDaysInMonth[currentMonthIndex-1] + firstWeekDayOfMonth - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CalendarViewCell
        cell.backgroundColor = UIColor.clear
        cell.delegate = self
        if indexPath.item <= firstWeekDayOfMonth - 2 {
            cell.isHidden = true
        } else {
            let calcDate = indexPath.row - firstWeekDayOfMonth + 2
            cell.isHidden = false
            cell.cellLabel.text = "\(calcDate)"
            if calcDate < todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex {
                cell.isUserInteractionEnabled = false
                cell.cellLabel.textColor = .lightGray
            } else {
                cell.isUserInteractionEnabled = true
                cell.cellLabel.textColor = Style.activeCellLabelColor
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = Colors.darkRed
//        let label = cell?.subviews[1] as! UILabel
//        label.textColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = .clear
        
//        let label = cell?.subviews[1] as! UILabel
//        let label = cell.
//        label.textColor = Style.activeCellLabelColor
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 7 - 8
        let height: CGFloat = 40
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    
    
    var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonthIndex: Int = 0
    var currentYear: Int = 0
    var presentMonthIndex = 0
    var presentYear = 0
    var todaysDate = 0
    var firstWeekDayOfMonth = 0 // (sun-sat 1-7)
    
    let monthView = MonthView()

    let weekdaysView = WeekdaysView()
    
    let myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let myCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        myCollectionView.showsHorizontalScrollIndicator = false
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
//        myCollectionView.backgroundColor = UIColor.clear
        myCollectionView.backgroundColor = Colors.darkGray
        
        myCollectionView.allowsMultipleSelection = false
        return myCollectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeView()
    }
    
    convenience init(theme: MyTheme) {
        self.init()
        
        theme == .dark ? Style.themeDark() : Style.themeLight()
        
        initializeView()
    }
    
    func changeTheme() {
        myCollectionView.reloadData()

        monthView.monthYearLabel.textColor = Style.monthViewLabelColor
        monthView.rightButton.setTitleColor(Style.monthViewButtonRightColor, for: .normal)
        monthView.leftButton.setTitleColor(Style.monthViewButtonLeftColor, for: .normal)
        
        for i in 0 ..< 7 {
            (weekdaysView.myStackView.subviews[i] as! UILabel).textColor = Style.weekdaysLabelColor
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeView() {
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        
        firstWeekDayOfMonth = getFirstWeekday()
        
        // for leap years, make february month of 29 days
        if currentMonthIndex == 2 && currentYear % 4 == 0 {
            numOfDaysInMonth[1] = 29
        }
        
        presentMonthIndex = currentMonthIndex
        presentYear = currentYear
        
        setupViews()
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(CalendarViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    func setupViews() {
        addSubview(monthView)
        monthView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        monthView.setHeight(35)
        monthView.delegate = self
        
        addSubview(weekdaysView)
        weekdaysView.anchor(top: monthView.bottomAnchor, left: leftAnchor, right: rightAnchor)
        weekdaysView.setHeight(30)
        
        addSubview(myCollectionView)
        myCollectionView.anchor(top: weekdaysView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
    
    func getFirstWeekday() -> Int {
        let day = ("\(currentYear) - \(currentMonthIndex)-01".date?.firstDayOfTheMonth.weekday)!
        return day
    }
    
    
    
}

extension CalendarView: MonthViewDelegate {
    func didChangeMonth(monthIndex: Int, year: Int) {
        currentMonthIndex = monthIndex + 1
        currentYear = year
        
        // for leap year, make february month of 29 days
        if monthIndex == 1 && currentYear % 4 == 0 {
                numOfDaysInMonth[1] = 29
        }
        
        firstWeekDayOfMonth = getFirstWeekday()
        myCollectionView.reloadData()
    }
}


extension Date {
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    
    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
    }
}

extension String {
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var date: Date? {
        return String.dateFormatter.date(from: self)
    }
}
