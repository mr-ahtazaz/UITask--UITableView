//
//  CalendarCell.swift
//  UI-Task-2
//
//  Created by Ahtazaz on 21/10/2020.
//  Copyright © 2020 Ahtazaz. All rights reserved.
//

import UIKit

class CalendarCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView   : UICollectionView!
    
    // MARK: - Properties
    var selectedCalendarCell = -1
    
    // MARK: - Constant
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    // MARK: - Cell Init Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = flowLayout
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: "DateCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
}


 

// MARK: - UICollectionView Implementation
extension CalendarCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    /// numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    /// cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DateCell
        
        if selectedCalendarCell == indexPath.row {
            cell.dateLabel.textColor = .black
            cell.weekLabel.textColor = .black
            cell.layer.cornerRadius = 8
            cell.backgroundColor = UIColor.systemOrange
        }
        else {
            cell.dateLabel.textColor = .white
            cell.weekLabel.textColor = .white
            cell.layer.cornerRadius = 0
            cell.backgroundColor = .clear
        }
        
        return cell
    }
    
    /// didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if selectedCalendarCell == indexPath.row {
            selectedCalendarCell = -1
            collectionView.reloadData()
            return
        }
        
        selectedCalendarCell = indexPath.row
        collectionView.reloadData()
    }
    
    /// sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (collectionView.frame.size.width - 60) / 7
        return CGSize(width: width, height: collectionView.frame.size.height)
    }
    
    /// minimumLineSpacingForSectionAt
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
}
