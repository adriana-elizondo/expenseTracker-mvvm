//
//  Model.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 06/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit

typealias DetailListComposed = ListModel & ExpenseListProtocol

protocol ExpenseProtocol {
    func title() -> String
    func price() -> Double
}

func +(left: ExpenseProtocol, right: ExpenseProtocol) -> Double {
    return left.price() + right.price()
}

protocol ListModel {    
    func all() -> [ExpenseProtocol]
    func element(at index: Int) -> ExpenseProtocol?
}

protocol ExpenseListProtocol {
    func percentage(for element : ExpenseProtocol) -> Double
    func total() -> Double
}

protocol DetailModel : ExpenseProtocol {
    func image() -> UIImage?
    func modelDescription() -> String
}
