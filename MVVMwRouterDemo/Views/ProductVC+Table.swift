//
//  ProductVC+Table.swift
//  MVVMwRouterDemo
//
//  Created by Vineet on 29/07/20.
//  Copyright © 2020 Sureify. All rights reserved.
//

import Foundation
import UIKit

// MARK:- ProductVC + Table
extension ProductVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = vm.products[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Router.shared.navigate(to: ProductDetailVC.self, action: .push) { () -> ProductDetailVC.RequiredParams in
            return self.vm.products[indexPath.row]
        }
    }
}
