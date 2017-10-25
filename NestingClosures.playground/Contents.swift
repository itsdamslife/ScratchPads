
import Foundation

func convertToInt(_ str: String) -> Int {
    print("Convert to Int func")
    guard let integer = Int(str) else { return -1 }
    return integer
}

func testFunc(_ completion: @escaping (String) -> Int) -> () -> Int {
    print("Inside Test Func")
    return {
        print("Test Func returning func")
        return completion("1234")
    }
}

let i = testFunc { str in
    print("Test Func completion handler")
    return convertToInt(str)
}()

print(i)
