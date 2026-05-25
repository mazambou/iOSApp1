//
//  OrderStore.swift
//  TimHortonCoffeeApp
//
//  Created by AZAMBOU Marcel on 2026-05-24.
//

import Foundation

// Stores and manages all orders
class OrderStore {
    
    // List of saved orders
    var orders: [Order] = []
    
    // Adds a new order
    func addOrder(customerName: String, drink: String, size: String) {
        let newOrder = Order(
            customerName: customerName,
            drink: drink,
            size: size
        )
        
        orders.append(newOrder)
    }
    
    // Deletes an order
    func deleteOrder(at offsets: IndexSet) {
        for index in offsets.sorted(by: >) {
            orders.remove(at: index)
        }
    }
}
