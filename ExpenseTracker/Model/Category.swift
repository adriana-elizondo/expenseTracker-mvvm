//
//  Category.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 06/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Category : Object, DetailModel {
    @objc dynamic var title: String = ""
    @objc dynamic var price: CGFloat = 0
    @objc dynamic var modelDescription: String = ""
    
    convenience init(with title: String){
        self.init()
        self.title = title
    }
}

class CategoryList : DetailListModel {
    typealias Element = Category
    
    var allElements = Array(realm.objects(Category.self))
    
    private func initialCategories() -> [Category]{
        return [Category(with: "Drinks"),
                Category(with: "Food"),
                Category(with: "Clothes"),
                Category(with: "Cigarettes"),
                Category(with: "Coffee"),
        ]
    }
    
    func all() -> [Element] {
        if allElements.count == 0 {
            let persistingHelper = PersistingHelper<Category>(with: Category())
            persistingHelper.add(objects: initialCategories())
        }
        
        return allElements
    }
    
    func element(at index: Int) -> Element? {
        guard allElements.count > index else {return nil}
        return allElements[index]
    }
}
