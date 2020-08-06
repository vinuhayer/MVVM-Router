//
//  ProductVC.swift
//  MVVMwRouterDemo
//
//  Created by Vineet on 29/07/20.
//  Copyright © 2020 Sureify. All rights reserved.
//

import UIKit

class ProductVC: UIViewController {

    // MARK:- IBOutlets
    @IBOutlet var tableMain: UITableView!
    
    // MARK:- Properties
    var vm = ProductVM() // View/VC owns View Model
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    // MARK:- Private functions
    private func initialSetup() {
        
        vm.delegate = self
        vm.fetchProducts()
    }
}

// MARK:- VM
extension ProductVC : ProductVMDelegate {
    func loader(show: Bool) {
        Loader.main.loading(show, loadingText: "Loading")
    }
    
    func updateUI() {
        tableMain.reloadData()
    }
}
