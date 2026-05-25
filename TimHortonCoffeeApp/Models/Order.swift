//
//  Order.swift
//  TimHortonCoffeeApp
//
//  Created by AZAMBOU Marcel on 2026-05-24.
//

import Foundation

// Represents one Tim Hortons order
struct Order: Identifiable {
    let id = UUID()
    var customerName: String
    var drink: String
    var size: String
}
