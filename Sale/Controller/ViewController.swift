//
//  ViewController.swift
//  Sale
//
//  Created by Iurie Guzun on 2021-10-23.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Product]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// Write to the Database
//        FIRDatabaseService.shared.post(parameters: ["title": "Another cool shirt", "cost": "29.00"], to: .products)

// Read from Database
//        FIRDatabaseService.shared.observe(.products) { (snapshot) in
//            print(snapshot.value)
//        }
        
        FIRDatabaseService.shared.observe(.products) { (snapshot) in
            guard let productSnapshot = ProductsSnapshot(snapshot: snapshot) else {return}
            print(productSnapshot)
        }
//        ProductsService.shared.delegate = self
//        ProductsService.shared.observeProducts()
    }
    
    @IBAction func onAddTapped() {
        AlertService.addProductAlert(in: self) { (product) in
            print("product = ",product)
            self.products.append(product)
            self.collectionView.reloadData()
//            ProductsService.shared.post(product: product)
        }
}
    
    @IBAction func onSubscribeTapped() {
        AlertService.subscribeAlert(in: self)
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell else { return UICollectionViewCell() }
        let product = products[indexPath.item]
        cell.configure(with: product)
        return cell
    }
    
}
