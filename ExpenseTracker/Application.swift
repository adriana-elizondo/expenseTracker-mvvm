//
//  Application.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 31/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit

class Application {
    //MARK: - Dependencies
    private let window: UIWindow
    private lazy var navigationController : UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.view.frame = window.bounds
        return navigationController
    }()
    
    lazy var navigation: Navigation = Navigation(
        window: self.window,
        navigationController: navigationController,
        application: self
    )
    
    //MARK: - Lifecycle
    init(window: UIWindow) {
        self.window = window
    }
}
