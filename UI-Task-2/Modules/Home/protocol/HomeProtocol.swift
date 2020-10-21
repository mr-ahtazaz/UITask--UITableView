//
//  HomeProtocol.swift
//  UI-Task-2
//
//  Created by Ahtazaz on 21/10/2020.
//  Copyright © 2020 Ahtazaz. All rights reserved.
//

import UIKit

protocol HomePresenterProtocol: class {
    var view : HomeViewProtocol? { get set }
    
    func viewDidLoad()
}

protocol HomeViewProtocol: class {
    
    func setupUI()
}



protocol HomeRouterProtocol: class {
    static func createHomeView() -> UIViewController
}
