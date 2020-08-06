//
//  ProductDetailVM.swift
//  MVVMwRouterDemo
//
//  Created by Vineet on 29/07/20.
//  Copyright © 2020 Sureify. All rights reserved.
//

//
//  ProductVM.swift
//  MVVMwRouterDemo
//
//  Created by Vineet on 29/07/20.
//  Copyright © 2020 Sureify. All rights reserved.
//

import Foundation

class ProductDetailVM {
    
    // MARK:- Model
    var product : Product?
    
    // MARK:- Functions
    func configure(_ view: ProductDetailVC) {
        view.lblName.text = product?.name
        view.lblDesc.text = product?.desc
    }
}

