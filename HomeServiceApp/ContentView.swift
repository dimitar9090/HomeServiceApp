//
//  ContentView.swift
//  HomeServiceApp
//
//  Created by Dimitar Angelov on 28.09.24.
//

import SwiftUI

struct ContentView: View {
    let services: [Service] = [
        Service(name: "Почистване на дома", description: "Основно почистване на помещенията.", price: 100.0, planType: .basic),
        Service(name: "Смяна на крушки", description: "Дребна техническа поддръжка", price: 120.0, planType: .basic),
        Service(name: "Пазаруване и доставки", description: "Закупуване на стоки и доставки до адрес", price: 150.0, planType: .standard),
        Service(name: "Градинарски услуги", description: "Поддръжка на градини", price: 200.0, planType: .premium)
    ]
    
    var body: some View {
        NavigationView {
            List(services, id: \.name) { service in
                NavigationLink(destination: ServiceDetailView(service: service)) {
                    VStack(alignment: .leading) {
                        Text(service.name)
                            .font(.headline)
                        Text(service.description)
                            .font(.subheadline)
                        Text("Цена: \(service.price, specifier: "%.2f") лв.")
                            .font(.footnote)
                    }
                }
            }
            .navigationTitle("Услуги")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
