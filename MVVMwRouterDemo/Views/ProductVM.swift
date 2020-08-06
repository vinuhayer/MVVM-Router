//
//  ProductVM.swift
//  MVVMwRouterDemo
//
//  Created by Vineet on 29/07/20.
//  Copyright © 2020 Sureify. All rights reserved.
//

import Foundation
// Note: VM is independent of UI Components

protocol ProductVMDelegate : class {
    func loader(show: Bool)
    func updateUI()
}

// VM updates View/VC for changes in model.
// VM does not know about View/VC
class ProductVM {
    
    // MARK:- Binding
    /*
     Binds View Model to View/VC for sending updates
     Binding could be one way i.e. through delegates/closures or two way like RX Observables or SwiftUI State + $
     */
    weak var delegate: ProductVMDelegate?
    
    // MARK:- Model
    /*
     VM owns Model
     */
    var products : [Product] = []
}

// MARK:- APIs
extension ProductVM {
    
    func fetchProducts() {
        
        delegate?.loader(show: true)
        
        // Usually this will be an API
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            
            if let path = Bundle.main.path(forResource: "Products", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path))

                    let jsonDecoder = JSONDecoder()
                    let result = try jsonDecoder.decode(RequestCodable.self, from: data)
                    self.products = result.products
                    self.delegate?.updateUI() // Update changes in model to View/VC
                } catch let e {
                    // Error
                    print(e.localizedDescription)
                }
            }
            
            self.delegate?.loader(show: false)
        }
    }
}
