//
//  ProductsService.swift
//  Sale
//
//  Created by Iurie Guzun on 2021-10-26.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import Foundation

protocol ProductsServiceDelegate {
    func didChange(products: [Product])
}

class ProductsService {
    
    private init() {}
    static let shared = ProductsService()
    var delegate: ProductsServiceDelegate?
    
    func observeProducts() {
        FIRDatabaseService.shared.observe(.products) { (snapshot) in
            guard let productsSnapshot = ProductsSnapshot(snapshot: snapshot) else { return }
            print("snapshot = ",snapshot)
            self.delegate?.didChange(products: productsSnapshot.products)
        }
    }
    
    func post(product: Product) {
        FIRDatabaseService.shared.post(parameters: product.parameters(), to: .products)
    }
    
}
