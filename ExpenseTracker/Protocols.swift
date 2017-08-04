//
//  Model.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 06/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit

protocol Model {
    var title : String {get set}
}

func +(left: DetailModel, right: DetailModel) -> CGFloat {
    return left.price + right.price
}

protocol DetailModel : Model {
    var price : CGFloat {get set}
    var modelDescription : String {get set}
}

protocol DetailListModel {
    associatedtype Element : DetailModel
    func all() -> [Element]
    func element(at index: Int) -> Element?
}
