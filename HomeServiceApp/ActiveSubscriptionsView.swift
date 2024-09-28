//
//  ActiveSubscriptionsView.swift
//  HomeServiceApp
//
//  Created by Dimitar Angelov on 28.09.24.
//

import SwiftUI

struct ActiveSubscriptionsView: View {
    @State private var subscriptions: [Subscription] = [
        Subscription(planType: .basic, price: 100.0, isActive: true),
        Subscription(planType: .standard, price: 150.0, isActive: true)
    ]

    var body: some View {
        NavigationView {
            List(subscriptions, id: \.planType.rawValue) { subscription in
                VStack(alignment: .leading) {
                    Text("План: \(subscription.planType.rawValue)")
                        .font(.headline)
                    Text("Цена: \(subscription.price, specifier: "%.2f") лв.")
                        .font(.subheadline)
                }
            }
            .navigationTitle("Активни Абонаменти")
        }
    }
}

struct ActiveSubscriptionsView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveSubscriptionsView()
    }
}
