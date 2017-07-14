//
//  HomeViewController.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 06/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController : UIViewController{
    @IBOutlet weak var testingLabel: UILabel!
    @IBOutlet weak var addNewElement: UIButton!
    
    
    private var viewModel : ListDetailViewModel<ExpenseList>?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard viewModel?.all() != nil else {
            self.testingLabel.text = "No elements found"
            return
        }
        
        self.testingLabel.text = "\(String(describing: viewModel?.all().count)) elements"
    
    }
    
    func setModel(model: ListDetailViewModel<ExpenseList>){
        self.viewModel = model
    }
    
    //PRAGMA MARK: Actions
    @IBAction func add(_ sender: Any) {
        
    }
    
}


