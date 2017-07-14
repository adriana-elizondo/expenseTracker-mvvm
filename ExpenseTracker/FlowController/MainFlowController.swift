//
//  MainFlowController.swift
//  ExpenseTracker
//
//  Created by Adriana Elizond/Users/adrianaelizondo/Documents/xcode projects/ExpenseTracker/ExpenseTracker/FlowControllero on 06/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit

class MainFlowController : FlowController {
    let configure: FlowConfigure
    var childFlow: FlowController?
    
    required init(configure : FlowConfigure) {
        self.configure = configure
    }
    
    //Flow protocol
    func start() {
        let navigationController = UINavigationController()
        if let frame = configure.window?.bounds {
            navigationController.view.frame = frame
        }
        
        configure.window?.rootViewController = navigationController
        configure.window?.makeKeyAndVisible()
        
        let homeConfig = FlowConfigure(window: nil, navigationController: navigationController, parent: self)
        childFlow = HomeFlowController(configure: homeConfig)
        childFlow?.start()
    }
}
