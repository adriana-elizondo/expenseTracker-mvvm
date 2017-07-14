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

class Category : Object, Model {
    @objc dynamic var title: String = ""
    private var persistHelper : PersistingHelper<Category>?
    
    required init() {
        super.init()
        persistHelper = PersistingHelper<Category>(with: self)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
    func allCategories() -> [Category]{
        return persistHelper!.allObjects()
    }
}

class CategoryList : ListModel {
    typealias Element = Category
    
    let allElements = Array(realm.objects(Category.self))
    
    func all() -> [Element] {
        return allElements
    }
    
    func element(at index: Int) -> Element? {
        guard allElements.count > index else {return nil}
        return allElements[index]
    }
}
