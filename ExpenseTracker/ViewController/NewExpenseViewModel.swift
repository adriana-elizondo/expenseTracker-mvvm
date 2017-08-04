//
//  NewExpenseViewModel.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 01/08/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation

class NewExpenseViewModel : DetailViewModel<Expense> {
    var saveNewExenseNavigation : (() -> Void)?
    
    
    override init(with model: Expense) {
        super.init(with: model)
    }
    
    func saveExpense(){
        let persistingHelper = PersistingHelper(with: self.model)
        persistingHelper.update(with: saveNewExenseNavigation ?? {})
    }
}

class CategoryViewModel : ListViewModel<CategoryList> {
    
    override init(with model: CategoryList) {
        super.init(with: model)
    }
}
