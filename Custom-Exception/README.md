## 1. Introduction 


## 2. What is use of Setup and tear down method?
**Setup method:** The setup method is called before each test case is run. It allows you to set up any necessary preconditions or state required for the test case to execute successfully. This method helps in reducing duplication and ensuring that tests are executed in isolation.

**Teardown method:** The teardown method is called after each test case is run. It allows you to clean up any resources or state that were created during the test case execution. This method is helpful in releasing memory, deallocating objects, or restoring the system to its original state after the test. 

## 3. How to unit test async functions?
- Use XCTest asynchronous testing methods.
- Fulfill expectations in completion handlers.
- Test concurrency and race conditions.

## 4. What you mean by swiftUI is declarative framework?
I meant you define the desired user interface by declaring its structure, layout, and behavior in a concise and declarative manner. Instead of manipulating the user interface through imperative code, you specify the desired state and let SwiftUI figure out how to update the interface accordingly.

You also describe the UI hierarchy and the relationships between different UI elements using Swift code. You declare the desired layout, properties, and interactions in a declarative manner, and SwiftUI takes care of updating the user interface automatically based on changes in the underlying data or state.

## 5. How to do multi threading in CoreData?
- Main Queue Concurrency Type: For UI-related tasks and interactions.
- Private Queue Concurrency Type: For background tasks.
- Fetch data on background threads: Create a new private NSManagedObjectContext. Fetch data in the background context using perform or performAndWait.
- Perform updates on background threads: Use the private context for inserting, updating, or deleting CoreData objects. Save the private context to persist changes.
- Observe NSManagedObjectContextDidSaveNotification: Listen for save notifications from the private context on the main context. Merge changes from the private context to the main context.


## 6. Diff b/w Operation Queue and GCD, when you will use which?
**Operation Queue:**

Operation Queue is a higher-level abstraction built on top of GCD.
It allows you to organize and manage a collection of tasks called operations.
Operations can be created by subclassing Operation or using BlockOperation.
Operation Queue provides additional features like dependencies, cancellation, and priority management.
It supports controlling the maximum number of concurrent operations.
Operation Queue is generally more suitable for complex task dependencies and when you need advanced control over operations.

**Grand Central Dispatch (GCD):**

GCD is a lower-level API for managing concurrent tasks.
It uses dispatch queues to handle tasks asynchronously.
GCD provides global concurrent queues (dispatch queues) and allows you to create your own custom queues.
Dispatch queues are FIFO (first-in, first-out) queues that execute blocks or functions.
GCD is lightweight, efficient, and designed for common concurrency patterns.
It is typically used for simple asynchronous tasks and when you don't need the additional features provided by Operation Queue.

## 7. What is dispatch barrier? 
When you dispatch a block with a barrier to a concurrent dispatch queue, it ensures that all previously dispatched blocks complete before the barrier block begins executing. Additionally, it prevents any blocks dispatched after the barrier from starting until the barrier block finishes execution.

A dispatch barrier in iOS is a way to enforce the serial execution of tasks within a concurrent dispatch queue, providing synchronization and avoiding race conditions.

## 8. What is use of different type of extensions in swift? 
**Extension of Classes/Structs/Enums:**
Add computed properties, instance methods, and type methods to existing types.
Implement protocol conformance for types that don't originally conform to a protocol.
Organize and categorize code by grouping related functionality.

**Extension of Protocols:**
Add default implementations for methods in protocols.
Extend protocols to provide additional requirements.
Implement protocol conformance for types that adopt the protocol.

## 9. What is Codable?
Codable is a protocol in Swift that allows you to easily encode (serialize) and decode (deserialize) data between Swift objects and external representations, such as JSON or Property List. It provides a convenient way to convert your custom Swift types to and from a serialized format without having to write explicit encoding and decoding logic.

## 10. When json keys are in snake case how will convert them to camel cases while parsing json data?
- Define a struct or class that represents the JSON data structure.
- Use the Codable protocol to enable JSON decoding and encoding.
- Add the CodingKeys enum within the struct or class to customize the key mappings.

## 11. What is optional binding?
Optional binding allows us to safely unwrap an optional by checking if it contains a value. If it does, we can assign the value to a constant or variable, and use it within the scope of the if statement.

## 12. Diff b/w array, set and dictionary.
Arrays are ordered and allow duplicates, sets are unordered and contain unique elements, and dictionaries are unordered collections of key-value pairs.

## 13. Diff b/w Associated values and raw values,  write code to explain both.
**Associated Enum**
```
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// Creating instances with associated values
let productBarcode = Barcode.upc(8, 85909, 51226, 3)
let serviceBarcode = Barcode.qrCode("ABC123")

// Accessing associated values
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let code):
    print("QR code: \(code)")
}

```
**Raw Value Enum**
```
enum Direction: String {
    case north = "N"
    case south = "S"
    case east = "E"
    case west = "W"
}

// Accessing raw values
let currentDirection = Direction.north
print("Current direction: \(currentDirection.rawValue)")
```

## 14. What is protocol?
Protocol is a set of methods and properties that define a blueprint for implementing functionality. It acts as a contract, specifying what methods and properties a class or struct must adopt in order to conform to the protocol. Conforming to a protocol allows objects to communicate and interact with each other in a predictable way, promoting code reuse and providing a clear structure for designing interfaces.

## 15.  MVC vs MVVM.
- MVC is a simpler pattern and can be a good choice for smaller projects or when the user interface is relatively simple.
- MVVM is recommended for larger projects with complex user interfaces, where the separation of concerns and testability are crucial. MVVM is good architechture for TTD workflow.

## 16. Explain singleton and there disadvantages , when should you use singleton? give an example.
**Disadvantages:**
- Singletons introduce global state, which can make the codebase more complex and harder to maintain. Changes made to a singleton's state can have unintended effects across the application.
- Singleton instances are tightly coupled with the code they are used in, making it difficult to isolate and test individual components. This can hinder unit testing and lead to dependencies on external resources.
- Singletons can make it challenging to manage dependencies and introduce hidden dependencies in the codebase. This can lead to difficulties in understanding and modifying the code.

**When to use:**
- If you have a resource that needs to be shared across multiple objects or components, such as a database connection or a file manager, a singleton can provide a convenient way to manage and access that resource.
- If you have configuration settings that need to be accessed throughout the application, a singleton can provide a centralized access point.
- Singletons can be useful for managing logging or analytics instances, ensuring that they are globally accessible and can be easily accessed from different parts of the application.

```
class SettingsManager {
    static let shared = SettingsManager()
    
    var themeColor: UIColor = .blue
    var fontSize: CGFloat = 14.0
}
```

## 17. What is retain cycle , how to resolve it?
A retain cycle in iOS development occurs when two or more objects hold strong references to each other, preventing them from being deallocated by the memory management system. This can lead to memory leaks and can cause performance issues in your app.

Instead of using a strong reference, use weak or unowned references when creating a reference to an object that should not keep it alive indefinitely. Weak references automatically become nil when the referenced object is deallocated, while unowned references assume that the referenced object will always exist.

## 18. Steps to do APNS.
1. Register your app with the Apple Developer Program and create an App ID with Push Notifications enabled.
2. Generate an SSL certificate or authentication key for your app's Push Notifications in the Apple Developer Portal.
3. Configure your Xcode project with the appropriate capabilities for Push Notifications.
4. Implement the code in your AppDelegate to request user permission for receiving push notifications using UNUserNotificationCenter.
5. In the same AppDelegate, handle the registration of the device token using didRegisterForRemoteNotificationsWithDeviceToken.
6. Set up and handle notification actions if required.
7. Create a server-side component that connects to APNS using the appropriate authentication method (certificate or authentication key).
8. Send push notification requests from your server to APNS with the device tokens of the target devices.
9. Handle received notifications on the client-side in the AppDelegate's didReceiveRemoteNotification method.
10. Test the push notification flow thoroughly to ensure it works as expected.
11. Implement error handling.

## 19. Explain SOLID.
**Single Responsibility Principle (SRP):** A class should have only one reason to change, meaning it should have a single responsibility or purpose.

**Open-Closed Principle (OCP):** Software entities (classes, modules, functions) should be open for extension but closed for modification. This means that you should be able to add new functionality without modifying existing code.

**Liskov Substitution Principle (LSP):** Subtypes must be substitutable for their base types, without breaking the behavior of the program. In other words, objects of a superclass should be replaceable with objects of its subclasses without affecting the correctness of the program.

**Interface Segregation Principle (ISP):** Clients should not be forced to depend on interfaces they do not use. This principle emphasizes the creation of smaller, more focused interfaces instead of large, general-purpose interfaces.

**Dependency Inversion Principle (DIP):** High-level modules/classes should not depend on low-level modules/classes directly. Both should depend on abstractions. This principle promotes loose coupling and allows for easier changes and modifications.

## 20. Explain different security you do in iOS.
**Secure Data Storage:** I use encryption techniques (such as using the Keychain Services API) to securely store sensitive user data, such as passwords or authentication tokens, on the device. This prevents unauthorized access to the data even if the device is compromised.

**Network Communication:** I employ secure protocols (e.g., HTTPS) to encrypt network communication between the app and server, preventing eavesdropping and data tampering. I also validate server certificates to avoid man-in-the-middle attacks.

**User Authentication:** I implement secure authentication mechanisms, such as biometric authentication (Touch ID, Face ID) or secure password hashing, to protect user accounts and prevent unauthorized access.

**App Sandbox:** I leverage iOS's sandboxing architecture, which enforces strict boundaries between the app and the rest of the system. This prevents unauthorized access to system resources and ensures data isolation between apps.

**Code Obfuscation:** I apply techniques like code obfuscation to make the app's binary harder to reverse engineer. By making the code more difficult to understand, it becomes less susceptible to tampering or exploitation.

**Regular Updates:** I keep up with the latest iOS updates and security patches to ensure that the app remains secure against known vulnerabilities. Regularly updating the app also helps protect against emerging threats.

**Input Validation:** I implement input validation and sanitization techniques to prevent common security vulnerabilities, such as cross-site scripting (XSS) or SQL injection attacks. This ensures that user input is properly validated and sanitized before being processed.

**Secure Key Management:** I follow best practices for managing cryptographic keys, including using the iOS Keychain to securely store encryption keys and avoid hardcoding them within the app's code.

**App Transport Security (ATS):** I configure ATS to enforce secure communication by default, allowing only encrypted connections to trusted servers and preventing potential security risks associated with insecure network connections.

**Penetration Testing:** I conduct regular penetration testing to identify and address potential vulnerabilities in the app. This involves simulated attacks and security assessments to uncover any weaknesses that need to be addressed.

## 21. iOS app life cycle methods.
**application(_:didFinishLaunchingWithOptions:)_:**  Called when the app finishes launching. Use it to initialize app-wide resources.

**applicationWillResignActive(_:)_:** Called when the app is about to become inactive, such as when a phone call or message arrives. Use it to pause ongoing tasks or save app state.

**applicationDidEnterBackground(_:)_:** Called when the app enters the background. Use it to release shared resources, save user data, and invalidate timers.

**applicationWillEnterForeground(_:)_:** Called when the app is about to enter the foreground. Use it to undo changes made in the applicationDidEnterBackground method.

**applicationDidBecomeActive(_:)_:** Called when the app becomes active. Use it to restart tasks that were paused or not executed in the background.

**applicationWillTerminate(_:)_:** Called when the app is about to terminate. Use it to save user data, state information, and perform any necessary cleanup tasks.


## ** live coding **

1. Create a class for which we can create only 3 object, when we try to create 4th object onward it should throw custom exception. 

