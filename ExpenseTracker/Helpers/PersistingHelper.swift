//
//  PersistingHelper.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 11/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class PersistingHelper <O: Object>{
    let realmObject : O
    
    init(with object: O){
        self.realmObject = object
    }
    
    func allObjects() -> [O]{
        return Array(realm.objects(O.self))
    }
    
    func update(){
        try! realm.write {
            realm.add(realmObject)
        }
    }
}


