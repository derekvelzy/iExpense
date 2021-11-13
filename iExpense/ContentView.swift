//
//  ContentView.swift
//  iExpense
//
//  Created by Derek Velzy on 11/11/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()

    var body: some View {
        NavigationView {
            List {
                // Because expenses.item is an Identifiable, you only need
                // ForEact(expenses.items) { item in ...}
                ForEach(expenses.items, id: \.id) {
                    item in
                    Text(item.name)
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    expenses.items.append(expense)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Store user data in "AppStorage":
// ex ->   @AppStorage("tapCount") private var tapCount = 0
// Great for storing simple things like integers and booleans

// For more complex storage, like structs, use UserDefaults and Codable:
// struct User: Codable { ... }

//  @State private var user = UserUser(first: "Taylor")
//  let encoder = JSONEncoder()
//
//  if let data = try? encoder.encode(user) {
//    UserDefaults.standard.set(data, forKey: "UserData ")
//  }
