import SwiftUI

class User: ObservableObject {
    var first = "Bilbo"
    var last = "Baggins"
}

struct ContentViewz: View {
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            Text("Hello, world, I am \(user.first) \(user.last)!")
                .padding()
            
            TextField("First name", text: $user.first)
            
            TextField("First name", text: $user.last)
        }
    }
}

// Structs always have one unique owner at a time
// Classes can have multiple things point to the same instance value

// If you have two instances of structs and change properties on one, the other instance will not reflect those changes
// With Classes, changing the properties of an instance will share changes between instances

// When you change a property in a struct, the entire struct gets rebuilt
// When you change a property in a class, the instance is constant and isn't rebuilt, even if the props change

// Use @Published property wrapper to tell swiftui to announce changes on those properties - reload to show the changes
// Use @StateObject property wrapper in the Struct
// Make the class with properties an "ObservableObject"
// DO NOT use "private" because the state is now being shared publicly

// This is propert state management: storing state in an ObservableObject
