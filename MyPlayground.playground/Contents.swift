import UIKit
import PlaygroundSupport

//: Playground - noun: a place where people can play

import UIKit

class Record {
    
    let date: Date
    var title: String? {
        didSet {
            print("title changed to: \(self.title)")
        }
    }
    var tags: [String]? {
        didSet {
            print("tags changed to: \((self.tags as! [String]).joined(separator:","))")
        }
    }
    var text: String? {
        didSet {
            print("text changed to: \(self.text)")
        }
    }
    
    init(date: Date, title: String?, tags: [String]?, text: String?) {
        self.date = date
        self.title = title
        self.tags = tags
        self.text = text
        
    }
    init?(date: Date) {
        self.date = date
        if date.compare(Date()) == .orderedDescending { return nil }
    }
    func description() -> String {
        var finalStr = ""
        finalStr += formatDate(date: self.date)
        finalStr += self.title != nil ? "\n\(title as! String)" : ""
        finalStr += tags != nil ? "\n[\((tags as! [String]).joined(separator: "]["))]" : ""
        finalStr += self.text != nil ? "\n\(text as! String)" : ""
        return finalStr
    }
    
    func formatDate (date:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy"
        return formatter.string(from: date)
    }
}

let post1 = Record(date: Date(), title: "title test", tags: ["tag1","tag2"], text: "description")
print(post1.description())

let post2 = Record(date: Date(), title: "title 2 test", tags: ["tag12","tag22"], text: "description2")
print(post2.description())

let post3 = Record(date: Date())
print(post3?.description() as Any)


