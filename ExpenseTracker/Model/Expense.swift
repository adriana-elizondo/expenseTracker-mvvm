//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 06/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import RealmSwift
import PieCharts

class Expense: Object, DetailModel{
    @objc dynamic var title : String = ""
    @objc dynamic var price : CGFloat = 0.0
    @objc dynamic var modelDescription : String = ""
    @objc dynamic var date : Date = Date()
    @objc dynamic var category : Category?
    
    convenience init(with title: String, price: String, modelDescription: String, category: Category){
        self.init()
        self.title = title
        self.price = CGFloat((price as NSString).floatValue)
        self.modelDescription = modelDescription
        self.category = category
        self.date = Date()
    }
}

class ExpenseList : DetailListModel {
    typealias Element = Expense
    
    func all() -> [Element] {
        return Array(realm.objects(Expense.self))
    }
    
    func element(at index: Int) -> Expense? {
        let allElements = Array(realm.objects(Expense.self))
        guard allElements.count > index else {return nil}
        return allElements[index]
    }
}


