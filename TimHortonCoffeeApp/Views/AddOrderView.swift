//
//  AddOrderView.swift
//  TimHortonCoffeeApp
//
//  Created by AZAMBOU Marcel on 2026-05-24.
//
import SwiftUI

struct AddOrderView: View {
    
    @Binding var orders: [Order]
    
// Used to close the current sheet after saving the order.
    @Environment(\.dismiss) var dismiss

// Stores user input values for the form.
    @State private var customerName = ""
    @State private var selectedDrink = "Coffee"
    @State private var selectedSize = "Medium"
    
// Available drink options shown in the picker.
    let drinks = ["Coffee", "Tea", "Latte", "Hot Chocolate", "Iced Capp"]
    
// Available size options shown in the picker.
    let sizes = ["Small", "Medium", "Large", "Extra Large"]
    
    var body: some View {
        NavigationStack {
            Form {
// The user enters the customer name.
                Section("Customer") {
                    TextField("Enter customer name", text: $customerName)
                }
                
                Section("Order") {
                    // Picker used to select a drink.
                    Picker("Drink", selection: $selectedDrink) {
                        ForEach(drinks, id: \.self) { drink in
                            Text(drink)
                        }
                    }
                    // Picker used to select a drink size.
                    Picker("Size", selection: $selectedSize) {
                        ForEach(sizes, id: \.self) { size in
                            Text(size)
                        }
                    }
                }
                // Button used to create and save a new order.
                Button("Save Order") {
                    let newOrder = Order(
                        customerName: customerName,
                        drink: selectedDrink,
                        size: selectedSize
                    )
                    // Adds the new order to the shared orders array.
                    orders.append(newOrder)
                    dismiss()
                }
// Disables the save button if the customer name is empty.
                .disabled(customerName.isEmpty)
            }
            .navigationTitle("Add Order")
        }
    }
}

#Preview {
    AddOrderView(orders: .constant([]))
}
