//
//  NewExpenseViewController.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 11/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class NewExpenseViewController : UIViewController{
    private var categoryViewModel : CategoryViewModel?
    private var viewModel : NewExpenseViewModel?
    
    @IBOutlet private weak var titleLabel: UITextField!
    @IBOutlet private weak var descriptionLabel: UITextField!
    @IBOutlet private weak var priceLabel: UITextField!
    
    private var pickerView = UIPickerView()
    @IBOutlet weak var categoryTextField: UITextField!
    
    
    convenience init(viewModel: NewExpenseViewModel, categoryViewModel: CategoryViewModel){
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.categoryViewModel = categoryViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI(){
        pickerView.delegate = self
        pickerView.dataSource = self
        
        categoryTextField.inputView = pickerView
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dissmissKeyboard(){
        self.view.endEditing(true)
    }
    
    @IBAction private func saveExpense(_ sender: Any) {
        viewModel?.model = Expense(with: self.titleLabel.text!, price: self.priceLabel.text!, modelDescription: self.descriptionLabel.text!, category: Category(with: self.categoryTextField.text!))
        viewModel?.saveExpense()
    }
}

extension NewExpenseViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    // DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryViewModel!.all().count
    }

    // Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryViewModel?.element(at: row)?.title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = categoryViewModel?.element(at: row)?.title
    }

}


