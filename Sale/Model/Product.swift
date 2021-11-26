//
//  Product.swift
//  Sale
//
//  Created by Iurie Guzun on 2021-10-23.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import Foundation

struct Glogal {
    static var numberOfProducts = 0
}


struct Product {
    let title: String
    let cost: Double
    
    init(title: String, cost: Double) {
        self.title = title
        self.cost = cost
    }
    
    init?(valueDict: [String: Any]) {
        guard let title = valueDict["title"] as? String,
            let cost = valueDict["cost"] as? Double
            else { return nil }
        
        self.title = title
        self.cost = cost
    }
    
    
    func price() -> String {
        let costString = String(format: "%.2f", cost)
        return "$" + costString
    }
    
    func parameters() -> [String: Any] {
        let dict: [String: Any] = ["title": title,
                                   "cost": cost]
        return dict
    }
}
