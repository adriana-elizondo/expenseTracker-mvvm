//
//  RouterHelper.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 14/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation

class RouterHelper {
    static let sharedInstance = RouterHelper()
    private var flowConfiguration : FlowConfigure?
    
    private init() {}
    
    func setUp(with configuration: FlowConfigure){
        self.flowConfiguration = configuration
    }
    
    func mainFlow(){
        guard flowConfiguration != nil else {return}
        let mainFlow = MainFlowController(configure: flowConfiguration!)
        mainFlow.start()
    }
    
//    func newExpense(with parent: FlowController){
//        let newExpenseFlow = NewExpenseFlowController(configure: flowConfiguration, parent: parent)
//        newExpenseFlow.start()
//    }
//    
    func showHomeController(){
        let homeController = HomeFlowController(configure: flowConfiguration!)
        homeController.start()
    }
}
