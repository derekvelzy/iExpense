//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Derek Velzy on 11/13/21.
//

import Foundation

// Make this an "Identifiable" protocol as a performance upgrade
// Only requirement is that it has an "id" prop
struct ExpenseItem: Identifiable, Codable {
    // create an id with a universal unique identifier
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
