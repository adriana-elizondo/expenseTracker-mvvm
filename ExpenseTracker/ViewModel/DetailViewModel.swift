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

class DetailViewModel<D: DetailModel>{
    let model : D
    
    init(with model: D){
        self.model = model
    }
    
    
    func persist(){
        
    }

}
