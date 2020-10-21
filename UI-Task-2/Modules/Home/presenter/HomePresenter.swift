//
//  HomePresenter.swift
//  UI-Task-2
//
//  Created by Ahtazaz on 21/10/2020.
//  Copyright © 2020 Ahtazaz. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol {    
    var view: HomeViewProtocol?
    
    func viewDidLoad() {
        view?.setupUI()
    }
    
}
