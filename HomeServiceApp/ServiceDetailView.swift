//
//  ServiceDetailView.swift
//  HomeServiceApp
//
//  Created by Dimitar Angelov on 28.09.24.
//

import SwiftUI

struct ServiceDetailView: View {
    var service: Service
    @State private var subscription: Subscription?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(service.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(service.description)
                .font(.body)
            
            Text("Цена: \(service.price, specifier: "%.2f") лв.")
                .font(.headline)

            if let subscription = subscription {
                Text("Активен абонамент: \(subscription.planType.rawValue)")
                    .foregroundColor(.green)
            } else {
                Button(action: {
                    subscribeToService()
                }) {
                    Text("Заяви абонамент")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .navigationTitle(service.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func subscribeToService() {
        subscription = Subscription(planType: service.planType, price: service.price, isActive: true)
    }
}

struct ServiceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceDetailView(service: Service(name: "Почистване на дома", description: "Основно почистване на помещенията.", price: 100.0, planType: .basic))
    }
}
