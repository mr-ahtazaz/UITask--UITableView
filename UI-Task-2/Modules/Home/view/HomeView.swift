//
//  ViewController.swift
//  UI-Task-2
//
//  Created by Ahtazaz on 21/10/2020.
//  Copyright © 2020 Ahtazaz. All rights reserved.
//

import UIKit

class HomeView: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView   : UITableView!
    
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }


}

// MARK: - HomeViewProtocol
extension HomeView: HomeViewProtocol {
    
    func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
}


// MARK: - UITableView Implementation
extension HomeView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    /// numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 || section == 1 {
            return 1
        }
        else {
            return 20
        }
        
    }
    
    /// cellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath)
            return cell
            
        }
        else if indexPath.section == 1  && indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
            return cell
            
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "popularEventCell", for: indexPath)
            cell.selectedBackgroundView = UIView()
            return cell
        }
        
    }
    
    /// heightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  120
    }
    
    /// viewForHeaderInSection
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let vw = Header()
        
        if section == 0 {
            vw.label.text = "Event Dates"
        }  else if section == 1 {
            vw.label.text = "Events"
        } else {
            vw.label.text = "Popular Events"
        }
        
        return vw
    }
    
    /// heightForHeaderInSection
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}
