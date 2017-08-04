//
//  DetailViewModel.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 14/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

typealias DetailModelRealm = DetailModel & Object

class DetailViewModel<D: DetailModelRealm>{
    var model : D
    
    init(with model: D){
        self.model = model
    }
    
    func persist() {
        let persistingHelper = PersistingHelper<D>(with: model)
        persistingHelper.update(with: {})
    }
}
