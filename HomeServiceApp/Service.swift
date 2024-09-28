//
//  Service.swift
//  HomeServiceApp
//
//  Created by Dimitar Angelov on 28.09.24.
//

import Foundation

struct Service {
    var name: String
    var description: String
    var price: Double
    var planType: PlanType
}

enum PlanType: String {
    case basic = "Базов"
    case standard = "Среден"
    case premium = "Премиум"
}
