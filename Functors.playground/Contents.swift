//: Playground - noun: a place where people can play

import Cocoa

// Sort
var tsort: [String] = ["8","5","4","1"]
tsort.sort()


// Map
var money: [Int] = [1,2,3,4,5]
let moneyWithCurrency = money.map({ "$ \($0).00" })
moneyWithCurrency

var array : [Any?] = []

array.append("Vin")
array.append(nil)
array.append(nil)
array.append(nil)
array.count


let t1: [String?] = array.map({
    if let m = $0 {
        return "123 - \(m)"
    }
    return nil
})
print(t1)

let t: [String?] = array.flatMap({
    if let m = $0 {
        return "123 - \(m)"
    }
    return nil
})
print(t)

// Map with nil return
let numbers = ["5.6", "ten", "1", "2", "3", "4"]
let moneyWithCur: [String?] = numbers.map({
    if let mc: Int = Int($0) {
        return "\(mc) - eee"
    }
    return nil
})
print(moneyWithCur)

// Reduce
let numberStr = numbers.reduce("10", { x, y in
    "\(x)-\(y)"
})
numberStr


money.reduce(1, { x, y in
    x*y
})


// Filter
let filtered = money.filter({($0 <= 2)})
filtered

let nums = numbers.filter({
    if let doubleVal = Double($0) {
        return (doubleVal > 1.5) ? true : false
    }
    return false
})
nums


/*
 
 /// MARK: COURTESY: Some Blog - Contact me if you need me to add your credits
 
 Here are some problems to get your hands dirty with closures:
 
 Write a function applyTwice(f:(Float -> Float),x:Float) -> Float that takes a function f and a float x and aplies f to x twice i.e. f(f(x))
 
 Write a function applyKTimes(f:(Float -> Float),x:Float,k:Int) -> Float that takes a function f and a float x and aplies f to x k times
 
 Using applyKTimes write a function that raises x to the kth power
 
 Given an array of Users which have properties name:String and age:Int write a map function that returns an array of strings consisting of the user’s names

 Given an array of of dictionaries containing keys for “name” and “age” write a map function that returns an array of users created from it
 
 Given an array of numbers write a filter method that only selects odd integers
 
 Given an array of strings write a filter function that selects only strings that can be converted to Ints
 
 Given an array of UIViews write a filter function that selects only those views that are a subclass of UILabel
 
 Write a reduce function that takes an array of strings and returns a single string consisting of the given strings separated by newlines
 
 Write a reduce function that finds the largest element in an array of Ints
 
 You could implement a mean function using the reduce operation {$0 + $1 / Float(array.count)}. Why is this a bad idea?
 
 There’s a problem you encounter when trying to implement a parallel version of reduce. What property should the operation have to make this easier ?
 
 
 */
