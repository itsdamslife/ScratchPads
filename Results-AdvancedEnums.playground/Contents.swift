//: Playground - noun: a place where people can play

import Foundation

enum Result {
    case success(json: Int)
    case failure(err: String)
}

var counter : Int = 0
typealias HANDLER = (Result) -> Void
func getResult(completion: HANDLER) {
    
    if counter == 0 {
        let succesResult = Result.success(json: 10)
        completion(succesResult)
    } else {
        let failureError = Result.failure(err: "Error!")
        completion(failureError)
    }
}

func testFunc() {
    getResult { result in
        switch result {
        case .success(let json):
            print("SUCCESS \(json)")
        case .failure(let err):
            print("FAILURE \(err)")
        }
    }
}

testFunc()
counter += 1
testFunc()
