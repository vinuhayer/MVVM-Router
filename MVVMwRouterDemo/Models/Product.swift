//
//  Product.swift
//  MVVMwRouterDemo
//
//  Created by Vineet on 29/07/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation

struct RequestCodable: Codable {
    let products: [Product]
}

struct Product : Codable {
    
    let id: Int
    let name: String
    let desc: String
}
