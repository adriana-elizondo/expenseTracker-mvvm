//
//  ListViewModel.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 14/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit

class ListDetailViewModel<M: DetailListModel>{
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
    
    func percentage(for element: DetailModel) -> CGFloat {
        return (element.price * 100) / total()
    }
    
    func total() -> CGFloat{
        return model.all().reduce(0, {$0 + $1.price})
    }
}
