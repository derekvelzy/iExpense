//
//  Expenses.swift
//  iExpense
//
//  Created by Derek Velzy on 11/13/21.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
