//: Playground - noun: a place where people can play

import Foundation

enum BOOLEAN: String {
    case TRUE = "true"
    case FALSE = "false"
    case ZERO = "0"
    case ONE = "1"
}
extension Bool {
    init(boolean: String?) {
        
        guard let boolStr = boolean else {
            self = false
            return
        }
        
        switch boolStr {
        case BOOLEAN.TRUE.rawValue:
            fallthrough
        case BOOLEAN.ONE.rawValue:
            self = true
        case BOOLEAN.FALSE.rawValue:
            fallthrough
        case BOOLEAN.ZERO.rawValue:
            fallthrough
        default:
            self = false
        }
    }
}

/// MARK: Usages

var str:String? = "1"
Bool(boolean: str)
Bool(str!)

str = "true"
Bool(boolean: str)
Bool(str!)

str = "false"
Bool(boolean: str)
Bool(str!)

str = "sdasdada"
Bool(boolean: str)
Bool(str!)

str = ""
Bool(boolean: str)
Bool(str!)

str = "0"
Bool(boolean: str)
Bool(str!)

str = nil
Bool(boolean: str)

