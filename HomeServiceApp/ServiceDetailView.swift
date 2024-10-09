//
//  ServiceDetailView.swift
//  HomeServiceApp
//
//  Created by Dimitar Angelov on 28.09.24.
//
import SwiftUI

struct ServiceDetailView: View {
    var service: Service
    @Binding var activeSubscription: Subscription?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(service.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(service.description)
                .font(.body)
            
            planDetails(for: service.planType)
                            .padding(.top)
            
            Text("Цена: \(service.price, specifier: "%.2f") лв.")
                .font(.headline)

            
            

            if let subscription = activeSubscription, subscription.planType == service.planType {
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
        activeSubscription = Subscription(planType: service.planType, price: service.price, isActive: true)
    }
    
    private func planDetails(for planType: PlanType) -> some View {
        switch planType {
        case .basic:
            return AnyView(Text("Почистване на помещенията и дребна техническа поддръжка (смяна на крушки, монтиране на контакти)."))
        case .standard:
            return AnyView(Text("Всички услуги от Базовия план + пазаруване и доставки до адрес."))
        case .premium:
            return AnyView(Text("Всички услуги от Средния план + взимане и връщане на дрехи от химическо чистене или пране, поддръжка на градина."))
        }
    }
}
