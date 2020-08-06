//
//  ProductDetailVC.swift
//  MVVMwRouterDemo
//
//  Created by Vineet on 29/07/20.
//  Copyright © 2020 Sureify. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController, VCConfig {
    
    // MARK:- Requirements
    typealias RequiredParams = Product
    func config(with params: Product) {
        vm.product = params // Updating Product Detail VM
    }

    // MARK:- IBOutlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    // MARK:- Properties
    var vm = ProductDetailVM()
    
    // MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.configure(self)
    }
    
    deinit {
        print("Deinit \(self)")
    }
}
