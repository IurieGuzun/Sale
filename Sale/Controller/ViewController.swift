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
//        ProductsService.shared.delegate = self
//        ProductsService.shared.observeProducts()
    }
    
    @IBAction func onAddTapped() {
//        AlertService.addProductAlert(in: self) { (product) in
//            ProductsService.shared.post(product: product)
//        }
}
    
    @IBAction func onSubscribeTapped() {
//        AlertService.subscribeAlert(in: self)
    }

}

