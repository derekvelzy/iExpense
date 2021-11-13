//
//  Expenses.swift
//  iExpense
//
//  Created by Derek Velzy on 11/13/21.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        // read the data from UserDefaults from the "Items" key
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            // If we can read it, attempt to decode it as an array of ExpenseItem
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                // we use ".self" here because swift wants to know what we mean.
                // are we making a copy of the array?
                // are we trying to make a new one?
                // no, we're refering to the array type itself
                items = decodedItems
                return
            }
        }
        // else
        items = []
    }
}
