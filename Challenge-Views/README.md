## 1. What is optionals?
<p>Optionals are a key feature in Swift that allow developers to express the absence of a value for a particular variable or constant. In other words, an optional variable can either have a value or have no value at all (be nil). This is in contrast to non-optional variables, which must always have a value.</p>
<p>Behind the scenes, optionals in Swift are implemented using an enumeration called Optional. This enumeration has two possible states: .none, which represents the absence of a value, and .some(value), which represents the presence of a value. When you declare an optional variable, it is either set to .none or .some(value).</p>
<p>Optionals in Swift are designed to provide safer and more concise code compared to Objective-C. In Objective-C, there are no built-in optionals, and developers often use nil to represent the absence of a value. However, this can lead to runtime crashes if you mistakenly access a variable that is nil. In Swift, optionals help prevent these runtime crashes by forcing you to explicitly handle the case where a variable might be nil.</p>
<p>To consume an optional in Swift, you typically use optional binding or optional chaining. Optional binding allows you to check if an optional has a value and, if so, unwrap it into a non-optional variable. Optional chaining provides a way to access properties and call methods on an optional variable, while gracefully handling the case where the variable is nil.</p>

<p>Optionals are used in Swift for several reasons:</p>

- **Safety:** Optionals help catch and prevent runtime crashes by explicitly handling the absence of a value. This encourages developers to write more robust and error-resistant code.
- **Clarity:** By using optionals, you make it clear in your code that a variable or constant might be nil, making the absence of a value more explicit and reducing ambiguity.
- **Swift API design:** The Swift standard library and many third-party libraries use optionals extensively, allowing developers to interact with APIs that may or may not return a value.
- **Optionals as return types:** Optionals are commonly used as return types for functions or methods that may not always produce a result. This way, the caller can easily handle the case where no value is returned.

## 2. What is the difference b/w Obj- C  Null vs swift Nil?
<p>Objective-C's NULL is primarily used for C-style pointers, indicating the absence of a valid memory location, while Swift's nil is used for any optional type to represent the absence of a value or instance. Swift's nil provides more safety and expressiveness in dealing with optionals compared to Objective-C's NULL.</p>

## 3. What is the difference b/w escaping closure and non escaping closure?
- **Non-escaping** closures are closures that are executed synchronously and do not persist beyond the lifetime of the function or method that they are passed into. They are typically used for short-lived operations.
- **Escaping closures**, on the other hand, outlive the function or method that they are passed into. They are typically used when the closure needs to be executed asynchronously at a later time, such as when performing network requests or animations.

## 4. What is capture list?
It allows you to explicitly define how variables and constants are captured and retained by the closure.

The capture list is placed before the parameter list and body of the closure, enclosed in square brackets. It consists of a comma-separated list of variables or constants that are being captured, along with the capture specifier.

Capture specifiers can be either **`weak`**, **`unowned`**, or **`unowned(safe)`**. They define the memory management behavior for the captured references.

Here's a brief explanation of each specifier:

1. **`weak`**: It captures the reference weakly, meaning that the captured reference will be an optional type (**`Weak<T>`**). If the captured object is deallocated, the captured reference will automatically become **`nil`**.
2. **`unowned`**: It captures the reference as an unowned reference, assuming that the captured reference will always have a valid value. Unlike weak references, unowned references are non-optional and don't need to be unwrapped. If the captured object is deallocated, accessing the captured reference will result in a runtime error.
3. **`unowned(safe)`**: It captures the reference as an unowned reference, similar to **`unowned`**. However, if the captured object is deallocated, the captured reference will be set to a sentinel value (typically **`nil`**) instead of causing a runtime error.

## 5. What is the use of defer keyword?
The defer keyword in Swift is used to define a block of code that will be executed when the current scope is exited, regardless of how the scope is exited (whether it's through a return statement, an exception, or normal execution). It allows you to specify cleanup or finalization code that should always be executed before leaving the current scope.

The **`defer`** keyword helps to improve code readability and maintainability by allowing you to keep the cleanup code close to where the corresponding resources are acquired, making it easier to understand and manage the lifecycle of those resources.

Overall, the **`defer`** keyword in Swift is a powerful tool for ensuring that necessary cleanup tasks are always executed, providing more robust and reliable code.

## 6. Can we add more than one defer? If yes in what order they will be executed?
Yes, you can have multiple defer statements in a scope, and they will be executed in the reverse order of their appearance in the code. The last defer statement will be executed first, followed by the second-to-last, and so on, until the first defer statement is executed.

## 7. What are Actors?
Actors enable you to write concurrent code without worrying about managing locks or dealing with complex synchronization logic. They help simplify the development process by providing a clear and concise way to reason about concurrent behavior and avoid common pitfalls related to thread safety.

By marking a class, struct, or enumeration as an actor, you can define methods and properties that can be accessed safely from multiple concurrent tasks. The actor system handles the necessary synchronization and coordination behind the scenes, making it easier to write scalable and efficient code.

## 8. What is MainActor? 
MainActor is an attribute that can be applied to functions, properties, and types in Swift. When a function or property is marked with MainActor, it means that it can only be accessed from the main (UI) thread. Any attempts to access the marked code from a different thread will result in a compile-time error.

By using MainActor, you can ensure that your UI-related code, such as updating the user interface, manipulating views, or interacting with UIKit, is executed exclusively on the main thread. This helps prevent data races, synchronization issues, and other concurrency bugs that can occur when multiple threads access the same resources simultaneously.

## 9. Live Coding
1. create 2 views , first view should take 70% of screen height and rest other view should take. 
2. create a shared class which can be accessed across project , add swipe two number function in that. 
3. in first question , in first view add two labels to display two number, in 2nd view add button , click of that button swap those two numbers.
