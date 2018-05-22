//: Playground - noun: a place where people can play

//1. Написати екстеншин до класу Array який би додавав метод видалення по переданому елементу(а не індексу). Екстеншин повинен працювати лише для класів, які перегрузили протокол Equotable для порівняння;
//2. Добавити метод до того ж Array, котрий би безпечно діставав елемент за індексом та видаляв за індексом без крешу, якщо такого індексу не існує.

import Foundation

var strAr = ["q", "r", "y", "ad", "gf", "ig", "or", "gf", "re"]
var numbAr = [1,4,3,5,34,65,76,8]

class ArrayExtensions: Equatable {
    public static func ==(lhs: ArrayExtensions, rhs: ArrayExtensions) -> Bool {
        return false
    }
}

extension Array where Element: Equatable {
    mutating func removeObject(objectToRemove: Element) -> [Element] {
        guard let index = self.index(of: objectToRemove) else { return self }
        self.remove(at: index)
        return self
    }
    
    mutating func removeObjectByIndex(indexToRemove: Int) -> [Element] {
        if indexToRemove >= 0 && indexToRemove <= self.count {
        self.remove(at: indexToRemove)
    }
        return self
    }
}

strAr.removeObject(objectToRemove: "y")
numbAr.removeObject(objectToRemove: 5)

numbAr.removeObjectByIndex(indexToRemove: 12)
numbAr.removeObjectByIndex(indexToRemove: 6)



