//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 06/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import RealmSwift

class Expense: Object, DetailModel{
    @objc dynamic var title : String = ""
    @objc dynamic var price : CGFloat = 0.0
    @objc dynamic var modelDescription : String = ""
    @objc dynamic var category : Category?
    
    private var persistingHelper : PersistingHelper<Expense>?
    
    
    func persist(){
        persistingHelper = PersistingHelper<Expense>(with: self)
        persistingHelper?.update()
    }
    
    func image() -> UIImage? {
        return nil
    }

}

class ExpenseList : DetailListModel {
    typealias Element = Expense
    
    let allElements = Array(realm.objects(Expense.self))
    
    func all() -> [Element] {
        return allElements
    }

    func element(at index: Int) -> Expense? {
        guard allElements.count > index else {return nil}
        return allElements[index]
    }
    
    func percentage(for element: Expense) -> CGFloat {
        return 0
    }
    
    
    func total() -> CGFloat {
        return 0
    }

}


