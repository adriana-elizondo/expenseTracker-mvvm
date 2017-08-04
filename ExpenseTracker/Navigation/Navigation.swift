//
//  Navigation.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 31/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit

class Navigation {
    //MARK: - Private
    private let navigationController: UINavigationController
    private let application: Application
    
    //MARK: - Lifecycle
    init(window: UIWindow, navigationController: UINavigationController, application: Application) {
        self.application = application
        self.navigationController = navigationController
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
    }
    
    //MARK: - Public
    func start() {
        showHomeView()
    }
    
    //MARK: - Private
    private func showHomeView() {
        let expenseListModel = ExpenseList()
        let viewModel = HomeViewModel(with: expenseListModel)
        viewModel.addNew = { [weak self] in self?.showAddNewView()}
        
        let homeController = HomeViewController(viewModel: viewModel)
        self.navigationController.pushViewController(homeController, animated: true)
    }
    
    private func showAddNewView(){
        let categoryList = CategoryList()
        let categoryViewModel = CategoryViewModel(with: categoryList)
        let viewModel = NewExpenseViewModel(with: Expense())
        viewModel.saveNewExenseNavigation = {[weak self] in self?.navigationController.popViewController(animated: true)}
        
        let newExpenseController = NewExpenseViewController(viewModel: viewModel, categoryViewModel: categoryViewModel)
        self.navigationController.pushViewController(newExpenseController, animated: true)
    }
}

