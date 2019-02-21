import UIKit

(1,"zebra") < (2,"apple") //true becase 1 is less than 2; "zebra" and "apple" are not compared
(3,"apple") < (3,"bird") //true because 3 is equal to 3 , and "apple" is less than "bird"

//Ternary Conditional Operator
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20 )


//Nil-Coalescing Operator
let defaultColorName = "red"
var userDefinedColorName : String? // defalults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName //userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

//Range Operators
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//Half Range
let names = ["Anna","Alex","Brian","Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i+1) is called \(names[i])")
}

//One-Sided Ranges
for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

let range = ...5
range.contains(7)
range.contains(4)
range.contains(-1)


//Logical Operators
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

//Logical AND Operators
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!!!!")
}else {
    print("ACCESS DENIED")
}

//Logical OR Operators
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!!!")
} else {
    print("ACESS DENIED")
}

//Combining Logical Operators
//Note: The Swift logical operators && and || are left-associative, meaning that compound expressions with multiple logical operators evaluate the leftmost subexoression first
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
    
}


