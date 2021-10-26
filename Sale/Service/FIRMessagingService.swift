//
//  FIRMessagingService.swift
//  Sale
//
//  Created by Iurie Guzun on 2021-10-26.
//  Copyright © 2021 Iurie Guzun. All rights reserved.
//

import Foundation

import FirebaseMessaging

enum SubscriptionTopic: String {
    case newProducts = "newProducts"
}

class FIRMessagingService {
    
    private init() {}
    static let shared = FIRMessagingService()
    let messaging = Messaging.messaging()
    
    func subscribe(to topic: SubscriptionTopic) {
        messaging.subscribe(toTopic: topic.rawValue)
    }
    
    func unsubscribe(from topic: SubscriptionTopic) {
        messaging.unsubscribe(fromTopic: topic.rawValue)
    }
}
