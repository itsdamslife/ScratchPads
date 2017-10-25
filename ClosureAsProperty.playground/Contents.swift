//: Playground - noun: a place where people can play

import Foundation

typealias Closure = (_ repeating: Bool, _ value: Int) -> Void
typealias Closure1 = (_ test: String) -> Void

class Example {
    var callbackCopy: Closure?
    var timer: Timer?
    func test(repeating: Bool, callback: @escaping Closure) {
        callbackCopy = callback
        
        callback(repeating, 1)
        callback(repeating, 2)
        callback(repeating, 3)
        callback(repeating, 4)
        
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Example.timerFired), userInfo: nil, repeats: true)
        
        _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { [unowned self]
            timer in
            self.callbackCopy!(repeating, 5)
        })
    }
    
    @objc func timerFired(tmr: Timer) -> Void {
        print("Timer from Selector")
    }
}

class TestExample {
    
    let ex: Example = Example()
    func doSomething(repeatIt: Bool, callback: @escaping Closure1) {
        print("repeatIt")
        ex.test(repeating: repeatIt, callback: {
            repeating, value in
            callback("Printing \(value)")
        })
    }
}

let test: TestExample = TestExample()
test.doSomething(repeatIt: true, callback: {
    response in
    
    print("---->> \(response)")
    
})


