import UIKit

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0 , y = 0.0 , z = 0.0

var welcomeMessage : String = "Hello"

let 💩 = "shit"

print(💩)

let cat = "cat" ; print(cat)

let minValue = UInt8.min
let maxValue = UInt8.max

typealias AudioSample = UInt16

var maxAmplitudeFound = AudioSample.min


let orangesAreOrange = true

let turnipsAreDelicious = false

if turnipsAreDelicious { print("Mmm, tasty turnips!") } else { print("Eww, turnips are horrible.")  }

///Tuples
let http404Error = (404 , "Not Found")

let (statusCode , statusMessage ) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode, _ ) = http404Error
print("The status code is \(justTheStatusCode)")

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description : "OK" )
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

//Optional
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
print("Converted Number \(convertedNumber)")

var serverResponseCode : Int? = 404
serverResponseCode = nil

//Optional Binding
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an iteger value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}


if let firstNumber = Int("4") , let secondNumber = Int("42"),
    firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

//Implicitly Unwrapped Optionals
let possibleString : String? = "An optional string."

let forcedString : String = possibleString!

let assumedStrimg : String! = "An imlicitly unwrapped optional string."
let imlicitString : String = assumedStrimg


//Error Handling
func canThrowAnError() throws {
    //this function may or may not throw an error
}

do {
    try canThrowAnError()
    //no error was thrown
} catch {
    //an error was thrown
}


//Assertions and Preconditions
let age = -3
assert(age <= 0 ,"A person's age can't be less than zero.")

precondition(age < 0, "Index must be greater than zero")


