//
//  SubscriptionListView.swift
//  HomeServiceApp
//
//  Created by Dimitar Angelov on 29.09.24.
//

import SwiftUI

struct SubscriptionListView: View {
    @State private var activeSubscription: Subscription?
    let subscriptions: [Service] = [
        Service(name: "Базов план", description: "Почистване на дома и дребна техническа поддръжка.", price: 100.0, planType: .basic),
        Service(name: "Среден план", description: "Включва всичко от Базовия план + пазаруване и доставки.", price: 150.0, planType: .standard),
        Service(name: "Премиум план", description: "Включва всичко от Средния план + взимане и връщане на дрехи.", price: 200.0, planType: .premium)
    ]
    
    var body: some View {
        NavigationView {
            List(subscriptions, id: \.name) { service in
                NavigationLink(destination: ServiceDetailView(service: service, activeSubscription: $activeSubscription)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(service.name)
                                .font(.headline)
                            if let active = activeSubscription, active.planType == service.planType {
                                Text("Активен абонамент")
                                    .foregroundColor(.green)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Абонаментни планове")
        }
    }
}

struct SubscriptionListView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionListView()
    }
}
