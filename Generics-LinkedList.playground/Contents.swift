//: Generics - A trivial implementation of linked list data structure using Generics

import Foundation

protocol Value {
    associatedtype T = Equatable
    var value: T { get }
}

class Node<Element: Equatable> {
    let value: Element
    var next: Node?
    
    init(_ v: Element) {
        self.value = v
        self.next = nil
    }
}

class LinkedList<Element: Equatable> {
    
    var head: Node<Element>?
    
    func add(_ value: Element) {
        let n = Node<Element>(value)
        
        guard var lastNode = head else {
            head = n
            return
        }
        
        while lastNode.next != nil {
            lastNode = lastNode.next!
        }
        lastNode.next = n
    }
    
    func remove(_ value: Element) -> Bool {
        guard var lastNode = head else {
            return false
        }
        
        if lastNode.value == value {
            head = lastNode.next
            return true
        }
        
        while lastNode.next != nil {
            if lastNode.next!.value == value {
                lastNode.next = lastNode.next!.next
                return true
            }
            lastNode = lastNode.next!
        }
        return false
    }
    
    func printNodes() {
        print("List of nodes:")
        var lastNode = head
        while lastNode != nil {
            print(lastNode?.value ?? "Value not found")
            lastNode = lastNode?.next
        }
    }
}

// MARK: Test two - Float value
let llInt = LinkedList<Int>()
llInt.add(1)
llInt.add(2)
llInt.add(3)

print(llInt.remove(1))

llInt.printNodes()

print(llInt.remove(3))

llInt.printNodes()


// MARK: Test two - Float value
let llFloat = LinkedList<Float>()
llFloat.add(1.0)
llFloat.add(2.5)
llFloat.add(3.3)
llFloat.add(4.2)
llFloat.add(5.1)
llFloat.add(6.9)

print(llFloat.remove(1.0))

llFloat.printNodes()

print(llFloat.remove(3.0))

llFloat.printNodes()

print(llFloat.remove(6.9))

print(llFloat.remove(10))

llFloat.printNodes()

// MARK: Test three - Custom Data
struct CustomData: Equatable {
    let id: Int
    let name: String
    
    var value: String {
        return "\(id):\(name)"
    }
    
    static func ==(lhs: CustomData, rhs: CustomData) -> Bool {
        if lhs.id == rhs.id, lhs.name == rhs.name {
            return true
        }
        return false
    }
    
}

let llCustom = LinkedList<CustomData>()

let c1 = CustomData(id: 10, name: "Ten O' Ten")
let c2 = CustomData(id: 11, name: "Eleven O' Ten")
let c3 = CustomData(id: 12, name: "Ten O' Twelve")
let c4 = CustomData(id: 13, name: "Ten O' Thirteen")
let c5 = CustomData(id: 14, name: "Ten O' Fourteen")

llCustom.add(c1)
llCustom.add(c2)
llCustom.add(c3)

llCustom.printNodes()

llCustom.remove(c3)

llCustom.add(c4)
llCustom.add(c5)

llCustom.remove(c1)

llCustom.printNodes()


