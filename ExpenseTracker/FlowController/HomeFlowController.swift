//
//  HomeFlowController.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 10/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit

class HomeFlowController : FlowController {
    private let configure: FlowConfigure
    private let viewModel : ListDetailViewModel<ExpenseList>
    
    required init(configure: FlowConfigure) {
        self.configure = configure
        let model = ExpenseList()
        viewModel = ListDetailViewModel<ExpenseList>(with: model)
    }
    
    func start() {
        let homeController = HomeViewController(nibName: "HomeViewController", bundle: nil)
        homeController.setModel(model: viewModel)
        configure.navigationController?.pushViewController(homeController, animated: true)
    }
}
