//
//  ProductCell.swift
//  Sale
//
//  Created by Iurie Guzun on 2021-10-23.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imagePhoto: UIImageView!
    
    func configure(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = product.price()
    }
    }
