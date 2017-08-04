//
//  HomeViewController.swift
//  ExpenseTracker
//
//  Created by Adriana Elizondo on 06/07/2017.
//  Copyright © 2017 Adriana. All rights reserved.
//

import Foundation
import UIKit
import PieCharts

class HomeViewController : UIViewController{
    @IBOutlet weak var dateLabel: UILabel!{
        didSet{
            let dateFortmatter = DateFormatter()
            dateFortmatter.dateStyle = .medium
            dateLabel.text = dateFortmatter.string(from: Date())
        }
    }
    
    @IBOutlet weak var addNewElement: UIButton!
    @IBOutlet weak var pieChart: PieChart!
    
    private var viewModel : HomeViewModel?
    
    convenience init(viewModel: HomeViewModel){
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        pieChart.delegate = self
        pieChart.models = (self.viewModel?.mappedModels(with: { (expense) -> PieSliceModel in
            PieSliceModel(value: Double((self.viewModel?.percentage(for: expense))!), color: UIColor.randomColor())
        }))!
    }
    
    //MARK: - ViewModel
    private func bindToViewModel() {
        self.viewModel?.didUpdate = { [weak self] _ in
            self?.viewModelDidUpdate()
        }
        self.viewModel?.didError = { [weak self] error in
            self?.viewModelDidError(error: error)
        }
    }
    
    func viewModelDidUpdate(){
        
    }
    
    func viewModelDidError(error: Error){
        
    }
    
    //MARK: Actions
    @IBAction func add(_ sender: Any) {
        viewModel?.addNew!()
    }
    
}

extension HomeViewController : PieChartDelegate {
    func onSelected(slice: PieSlice, selected: Bool) {
        
    }
}


