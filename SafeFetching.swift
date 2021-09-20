//
//  SafeFetching.swift
//  
//
//  Created by Mahmoud Al-Belbeisi on 20/09/2021.
//

import Foundation

extension Array {
    public subscript(safe index: Int?) -> Element? {
        guard let index = index, index < self.count && index > -1 else { return nil }
        return self[index]
    }
    public subscript(update index: Int?) -> Element? {
        set {
            guard let _ = self[safe: index], let index = index, let obj = newValue  else { return }
            self[index] = obj
        }
        get {
            guard let obj = self[safe: index] else { return nil }
            return obj
        }
    }
}

// MARK: -  Example
let array = [1, 2, 3, 4, 5, 6]
array[safe: 7] // -> return nil
array[safe: -1] // -> return nil

class Person {
    var name: String?
    var age: Int?
    init(name: String?, age: Int) {
        self.name = name
        self.age = age
    }
}
var arrayOfPerson: [Person] = [.init(name: "Mahmoud", age: 20), .init(name: "Mohammed", age: 22), .init(name: "Ahmad", age: 26)]
let newPerson: Person = Person.init(name: "Ali", age: 25)
arrayOfPerson[update: 4] = newPerson  // (No update)
