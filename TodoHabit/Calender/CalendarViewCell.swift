//
//  CalendarViewCell.swift
//  TodoHabit
//
//  Created by Mac mini on 2021/08/27.
//

import UIKit

protocol CalendarViewCellDelegate: AnyObject {
    func cellPressed()
}

class CalendarViewCell: UICollectionViewCell {
    
    weak var delegate: CalendarViewCellDelegate?
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Colors.darkGray
        return label
    }()
    
    lazy var emptyView: UIView = { //
        let v = UIView()
        v.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cell))
        v.addGestureRecognizer(tap)
        v.isUserInteractionEnabled = true
        return v
    }()
    
    @objc func cell() {
        print("cell pressed from calendarViewCell")
        delegate?.cellPressed()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        layer.cornerRadius = 5
        layer.masksToBounds = true
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(cellLabel)
//        cellLabel.fillSuperview()
        cellLabel.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        cellLabel.setHeight(15)
        
        addSubview(emptyView)
        emptyView.anchor(top: cellLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
}
