//
//  HabitController.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/25.
//

import UIKit
import CoreData

private let reuseIdentifer = "Cell"
private let headerIdentifier = "HabitHeader"
private let footerIdentifier = "HabitFooter"

// I ... need to give a way to edit each habit. how ??

class HabitController: UICollectionViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var habits: [Habit]?
        
    var today: Int? // when it matches to one of dates in Habit, then show.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        today = Date().dayNumberOfWeek()
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = true
        fetchHabits()
        configureUI()
        
        let currentDate = Date()

        print("currentDate : \(currentDate.dayNumberOfWeek())")
    }
    
    func fetchHabits() {
        do {
            let request = Habit.fetchRequest() as NSFetchRequest<Habit>
            
//            let sort = NSSortDescriptor(key: "createdAt", ascending: true)
//            let pred = NSPredicate(format: "onDate CONTAINS %@", arguments: today) // do it later.
//            let pred = NSPredicate(format: "onDate CONTAINS %@", argumentArray: <#T##[Any]?#>)
            
//            request.sortDescriptors = [sort]
            
            self.habits = try context.fetch(request)
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } catch {
            print("DEBUG : Error Occurred during fetching habits")
        }
    }
    
    func removeHabit(){
        // Which habit to remove
//        let habitToRemove = self.habits![0]
        
        // Remove the habit
//        self.context.delete(habitToRemove)
        
//        do {
//            try self.context.save()
//        } catch {
//            print("ERROR DURING REMOVING HABIT")
//        }
        
        fetchHabits()
        
    }
    
    func updateHabit() {
        // get the selected habit
//        let habit = self.habits![0]
        // edit name property of habit object
//        habit.title = "updatedTitle"
        // save the data
        do {
            try self.context.save()
        } catch {
            
        }
        fetchHabits()
    }
    
    
    func configureUI() {
        collectionView.backgroundColor = .white
        collectionView.register(HabitCell.self, forCellWithReuseIdentifier: reuseIdentifer)
        collectionView.register(HabitHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        collectionView.register(HabitFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerIdentifier)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifer, for: indexPath) as! HabitCell
        
        cell.viewModel = HabitViewModel(habit: habits![indexPath.row])
        cell.habitCell = habits![indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habits?.count ?? 0
    }
}


// MARK: - UICollectionView DataSource

extension HabitController {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        
        case UICollectionView.elementKindSectionHeader:
            
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! HabitHeader
            headerView.delegate = self
            
            headerView.backgroundColor = UIColor(white: 0.6, alpha: 0.2)
            return headerView
            
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerIdentifier, for: indexPath) as! HabitFooter
            footerView.delegate = self
//            footerView.backgroundColor = UIColor(white: 0.6, alpha: 0.2)
            return footerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
    }
    
    // margin for collectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 15, right: 10)
    
    }
}

// MARK: - UICOllectionViewDelegateFlowLayout

extension HabitController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height : CGFloat = 50
        let width : CGFloat = view.frame.width - 20
        return CGSize(width: width, height: height)
    }
    
    // space between Items in collectionView
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // size for Header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    
    
    // size for Footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let height : CGFloat = 50
        let width : CGFloat = view.frame.width - 20

        return CGSize(width: width, height: height)
    }
}


extension HabitController: HabitFooterDelegate {
    func presentAddController() {
//        print("from HabitController! ")
        let addHabitController = AddHabitController()
        addHabitController.delegate = self
        self.present(addHabitController, animated: true, completion: nil)
    }
}


extension HabitController: AddHabitDelegate {
    func addHabit(with title: String, dates: [Int], goal: Int) {
        print("addHabit in HabitController")

        let newHabit = Habit(context: self.context)
//        newHabit.createdAt = Date()
//        newHabit.goalPeriod = Int64(goal)
//        newHabit.onDates = dates
        newHabit.title = title
        
        fetchHabits()
       
    }
}

extension HabitController: HabitHeaderDelegate {
    func searchHabit() {
        print("what is this for .. ?? ")
    }
}
