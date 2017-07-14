//
//  NewExpenseViewController.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 11/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit

class NewExpenseViewController : UIViewController{
    private var categoryViewModel : ListViewModel<CategoryList>?
    private var viewModel : DetailViewModel<Expense>?
    private var model : Expense?
    
    @IBOutlet private weak var titleLabel: UITextField!
    @IBOutlet private weak var descriptionLabel: UITextField!
    @IBOutlet private weak var priceLabel: UITextField!
    
    private var pickerView = UIPickerView()
    @IBOutlet weak var categoryTextField: UITextField!
    
    
    convenience init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, categoryViewModel: ListViewModel<CategoryList>) {
        self.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.categoryViewModel = categoryViewModel
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setUpUI(){
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    @IBAction private func saveExpense(_ sender: Any) {
        model = Expense()
        model?.title = titleLabel.text ?? ""
        model?.modelDescription = descriptionLabel.text ?? ""
        
        viewModel = DetailViewModel(with: model!)
        viewModel?.persist()
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

    }

}

