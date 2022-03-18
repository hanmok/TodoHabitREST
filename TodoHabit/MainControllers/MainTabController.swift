//
//  MainTabController.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/25.
//

import UIKit

class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
    
    func configureViewControllers() {
        view.backgroundColor = .white
        let layout = UICollectionViewFlowLayout()
        
        let negative = templateNavigationController(unselectedImage: UIImage(systemName: "exclamationmark.arrow.triangle.2.circlepath")!, selectedImage: UIImage(systemName: "exclamationmark.arrow.triangle.2.circlepath")!, rootViewController: NegativeMainController())
        
        let habit = templateNavigationController(unselectedImage: UIImage(systemName: "arrow.triangle.2.circlepath")!, selectedImage: UIImage(systemName: "arrow.triangle.2.circlepath")!, rootViewController: HabitController(collectionViewLayout: layout))
       
//        let todo = templateNavigationController(unselectedImage: UIImage(systemName: "list.bullet")!, selectedImage: UIImage(systemName: "list.bullet")!, rootViewController: TodoMainController())
        let todo = templateNavigationController(unselectedImage: UIImage(systemName: "list.bullet")!, selectedImage: UIImage(systemName: "list.bullet")!, rootViewController: TodoController())
        
        let calendar = templateNavigationController(unselectedImage: UIImage(systemName: "calendar")!, selectedImage: UIImage(systemName: "calendar")!, rootViewController: CalendarMainController())
        
//        let settings = templateNavigationController(unselectedImage: UIImage(systemName: "gear")!, selectedImage: UIImage(systemName: "gear")!, rootViewController: SettingsController())
        
        let settings = templateNavigationController(unselectedImage: UIImage(systemName: "gear")!, selectedImage: UIImage(systemName: "gear")!, rootViewController: APITestViewController())
        
        viewControllers = [negative, habit, todo, calendar, settings]
        
        tabBar.tintColor = .black
    }
}
