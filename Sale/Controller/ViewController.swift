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
      print("View Did Load Accssed!")

        ProductsService.shared.delegate = self
        print("Before Reading from Database ")
        ProductsService.shared.observeProducts()

    }
    
    @IBAction func onAddTapped() {
        AlertService.addProductAlert(in: self) { (product) in
            print("product = ",product)
            ProductsService.shared.post(product: product)
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
        print("products.count = ",products.count)
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell else { return UICollectionViewCell() }
        let product = products[indexPath.item]
        cell.configure(with: product)
        print("indexPath = ",indexPath.item)
        let imageName = "sale-" + String(indexPath.item % 10)
        cell.imagePhoto.image = UIImage(named: imageName)
        return cell
    }
    
}
extension ViewController: ProductsServiceDelegate {
    func didChange(products: [Product]) {
        self.products = products
        collectionView.reloadData()
    }
}
