//
//  ListDetailViewModel.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 14/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation

class ListViewModel<M: ListModel>{
    let model : M
    
    init(with model: M) {
        self.model = model
    }
    
    func all() -> [M.Element] {
        return model.all()
    }
    
    func element(at index: Int) -> M.Element? {
        return model.all()[index]
    }
}
