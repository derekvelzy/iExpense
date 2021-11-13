import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String

    var body: some View {
        VStack {
            Text("Hello, \(name)")
            
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

struct ContentViews: View {
    @State private var showingSheet = false
    @State private var numbers = [Int]()
    @State private var currentNumber = 1

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                    
                    Button("Add number") {
                        numbers.append(currentNumber)
                        currentNumber += 1
                    }
                }
                
                Button("Show sheet") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    SecondView(name: "@dman_realty")
                }
            }
            .navigationTitle("On Delete")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

// onDelete and EditButton to remove items from a list with the swipe action

