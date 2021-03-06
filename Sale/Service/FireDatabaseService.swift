//
//  FireDatabaseService.swift
//  Sale
//
//  Created by Iurie Guzun on 2021-10-25.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import Foundation
import Firebase

enum FIRDatabaseReference: String {
    case products = "products"
}

class FIRDatabaseService {
    
    private init() {}
    static let shared = FIRDatabaseService()
    
    func reference(_ databaseReference: FIRDatabaseReference) -> DatabaseReference {
        print("Database Reference  = ", Database.database().reference().child(databaseReference.rawValue))
        return Database.database().reference().child(databaseReference.rawValue)
    }
    
    func observe(_ databaseReference: FIRDatabaseReference, completion: @escaping (DataSnapshot) -> Void) {
        print("observe function has been called ")

        reference(databaseReference).observe(.value) { (snapshot) in
            print("Snapshot from observe function = ", snapshot)
            completion(snapshot)
        }
    }
    
    func post(parameters: [String: Any], to databaseReference: FIRDatabaseReference) {
        reference(databaseReference).childByAutoId().setValue(parameters)
    }
    
}
