//
//  HomeViewModel.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 01/08/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel : ListViewModel<ExpenseList> {
    var addNew: (() -> Void)?
    
    override init(with model: ExpenseList) {
        super.init(with: model)
    }
}
