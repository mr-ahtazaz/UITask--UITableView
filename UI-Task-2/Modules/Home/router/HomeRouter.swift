//
//  HomeRouter.swift
//  UI-Task-2
//
//  Created by Ahtazaz on 21/10/2020.
//  Copyright © 2020 Ahtazaz. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter: HomeRouterProtocol {
    
    static func createHomeView() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeView
        
        let presenter = HomePresenter()
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
