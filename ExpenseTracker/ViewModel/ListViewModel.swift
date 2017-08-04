//
//  ListDetailViewModel.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 14/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit

class ListViewModel<M: DetailListModel>{
    let model : M
    
    init(with model: M) {
        self.model = model
    }
    
    //MARK: - Events
    var didError: ((Error) -> Void)?
    var didUpdate: ((M) -> Void)?
    
    func all() -> [M.Element] {
        return model.all()
    }
    
    func element(at index: Int) -> M.Element? {
        return model.all()[index]
    }
    
    func percentage(for element: M.Element) -> CGFloat {
        return (element.price * 100) / total()
    }
    
    func total() -> CGFloat {
        return model.all().reduce(0, { $0 + $1.price })
    }
    
    func mappedModels<T: Any>(with mappingClosure: @escaping (_ value : M.Element) -> T) -> [T] {
        return model.all().map {mappingClosure($0)}
    }

}
