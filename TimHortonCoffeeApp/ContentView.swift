//
//  ContentView.swift
//  TimHortonCoffeeApp
//
//  Created by AZAMBOU Marcel on 2026-05-24.
//

import SwiftUI

struct ContentView: View {
    
// Stores all customer orders inside the app.
    @State private var orders: [Order] = []
    @State private var showingAddOrder = false
    
    var body: some View {
        NavigationStack {
            VStack {
// Displays a message when there are no saved orders.
                if orders.isEmpty {
                    Text("No orders yet")
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(orders) { order in
                            VStack(alignment: .leading) {
                                Text(order.customerName)
                                    .font(.headline)
                                
                                Text("\(order.size) \(order.drink)")
                                    .foregroundColor(.secondary)
                            }
                        }
                        .onDelete { offsets in
                            orders.remove(atOffsets: offsets)
                        }
                    }
                }
            }
// Navigation title displayed at the top of the screen.
            .navigationTitle("Tim Hortons")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink("Timer") {
                        TimerView()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("+") {
                        showingAddOrder = true
                    }
                }
            }
            .sheet(isPresented: $showingAddOrder) {
                AddOrderView(orders: $orders)
            }
        }
    }
}

#Preview {
    ContentView()
}
