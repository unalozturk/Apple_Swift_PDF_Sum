import UIKit

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "UNAL"))

func sayHelloWorld () -> String {
    return "Hello, World"
}

print(sayHelloWorld())


func greett(person : String , alreadyGreeted : Bool ) -> String {
    if alreadyGreeted {
        //return greetAgain(person: person)
        return "asdasdasdas"
    } else {
        return greet(person: person)
    }
    
}


//Function Without Return
func greettt(person : String ) {
    print("Hello, \(person)!")
}

//Return value of a function can be ignored
func printAndCount(string: String ) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}

printAndCount(string: "hello, world")
//prints "hello, world" and return a value of 12
printWithoutCounting(string: "hello , world")
//print "hello, world" but does not return a value


//Functions with multiple Return Values
func minMax(array : [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}

let bounds = minMax(array: [8 , -6 , 2 , 109 , 3 , 71])
print("min is \(bounds.min) and max is \(bounds.max)")

//Optional Return
func minMaxx(array : [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    
    return (currentMin, currentMax)
}


//Function Argument Labels and Parameter Names
func someFunction(firstParameterName : Int ,  secondParameterName : Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters
}
someFunction(firstParameterName: 1, secondParameterName: 2)


//Specifying Argument Labels
func greetWithArgument(person: String,from hometown:String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)."
}

print(greetWithArgument(person: "Bill", from: "Cupertino"))


//Omitting Argument Label
func someFunctionn(_ firstParameterName: Int , secondParameterName: Int) {
    
}

someFunctionn(1, secondParameterName: 2)


//Default Parameter Values
func someFunctionnn(parameterWithoutDefault: Int , parameterWithDefault: Int = 12 ) {
    
}
someFunctionnn(parameterWithoutDefault: 23)
someFunctionnn(parameterWithoutDefault: 34, parameterWithDefault: 23)


//Variadic Parameters
func arithmeticMean(_ numbers : Double...) -> Double {
    var total  : Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1,2,3,4,5)


//In-Out Parameters

func swatTwoInts(_ a: inout Int , _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107

swatTwoInts(&someInt, &anotherInt)

print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


//FunctionTypes
func addTwoInts(_ a: Int , _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int , _ b: Int) -> Int {
    return a * b
}

var mathFunction : (Int , Int ) -> Int = addTwoInts
print("Result: \(mathFunction(2,3))")

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2,3))")


//Function Types as Return Types
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
//moveNearerToZero now refers to the stepBackward() function

print("Counting to zero:")
//Counting to zero:
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero(currentValue)
}
print("Zero!")

//Nested Functions
func chooseStepFunctionn(backward: Bool) -> (Int) -> Int {
    func stepForwardd(_ input: Int) -> Int {
        return input + 1
    }
    
    func stepBackwardd(_ input: Int) -> Int {
        return input - 1
    }
    return backward ? stepBackwardd : stepForwardd
}
