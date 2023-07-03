import Foundation

enum LimitedObjectError: Error {
    case instanceLimitExceeded
}

class LimitedObject {
    private static var instanceCount = 0
    private static let maxInstanceCount = 3
    
    init() throws {
        guard LimitedObject.instanceCount < LimitedObject.maxInstanceCount else {
            throw LimitedObjectError.instanceLimitExceeded
        }
        
        LimitedObject.instanceCount += 1
    }
    
    deinit {
        LimitedObject.instanceCount -= 1
    }
}


do {
    let obj1 = try LimitedObject()
    let obj2 = try LimitedObject()
    let obj3 = try LimitedObject()
    let obj4 = try LimitedObject() // Throws an exception
} catch LimitedObjectError.instanceLimitExceeded {
    print("Instance limit exceeded. Cannot create more instances.")
} catch {
    print("An error occurred: \(error)")
}
