//
//  AlertService.swift
//  Sale
//
//  Created by Iurie Guzun on 2021-10-23.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import UIKit

class AlertService {
    
    private init() {}
    
    static func addProductAlert(in vc: UIViewController, completion: @escaping (Product) -> Void) {
        let alert = UIAlertController(title: "New Product", message: "What's for sale?", preferredStyle: .alert)
        alert.addTextField { (titleTF) in
            titleTF.placeholder = "Title"
        }
        alert.addTextField { (priceTF) in
            priceTF.placeholder = "Price"
            priceTF.keyboardType = .numberPad
        }
        let send = UIAlertAction(title: "Send", style: .default) { (_) in
            guard let title = alert.textFields?.first?.text,
                let price = alert.textFields?.last?.text,
                let cost = Double(price)
  
                else {
                    print("Your Send didn't succeed!")
                    return }
            print("Your Send succeeded!")
            let product = Product(title: String((Glogal.numberOfProducts) % 10)+title, cost: cost)
            completion(product)
        }
        print(Glogal.numberOfProducts, Glogal.numberOfProducts)

        let imageName = UIImage(named: "sale-" + String((Glogal.numberOfProducts) % 10))
        
        var imageView = UIImageView(frame: CGRect(x: 200, y: 10, width: 60, height: 70))
        imageView.image = imageName
        alert.view.addSubview(imageView)
        
        alert.addAction(send)
        vc.present(alert, animated: true)
    }
    
    static func subscribeAlert(in vc: UIViewController) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let subscribe = UIAlertAction(title: "Subscribe", style: .default) { (_) in
            print("You tapped Subscribe!")
            FIRMessagingService.shared.subscribe(to: .newProducts)
        }
        let unsubscribe = UIAlertAction(title: "Unsubscribe", style: .default) { (_) in
            print("You tapped Unsubscribe!")
            FIRMessagingService.shared.unsubscribe(from: .newProducts)
        }
        alert.addAction(subscribe)
        alert.addAction(unsubscribe)
        vc.present(alert, animated: true)
    }
    
    
    
}
