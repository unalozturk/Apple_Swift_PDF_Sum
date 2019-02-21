import UIKit

//Closures
let name = ["Chris" , "Alex", "Ewa", "Barry", "Daniella"]


func backward(_ s1: String , _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = name.sorted(by: backward)

reversedNames = name.sorted(by: {(s1: String, s2: String)
    -> Bool in return s1 > s2  })

//Inferring Type
reversedNames = name.sorted(by: {s1, s2 in return s1 > s2 })

//Implicit Returns from Single-Expression Closures
reversedNames = name.sorted(by: { s1, s2 in s1 > s2 })

reversedNames = name.sorted(by: { $0 > $1 })

reversedNames = name.sorted(by: > )

//Trailling Closures
func someFunctionThatTakesAClosure(closure: () -> Void ) {
    //function body goes here
}

//Here's how you call this function without using a trailing closure:
someFunctionThatTakesAClosure(closure: {
    //Closure's body goes here
})

//Here's how you call this function with using a trailing closure:
someFunctionThatTakesAClosure {
    //Closure's body goes here
}

reversedNames = name.sorted() { $0 > $1 }

reversedNames = name.sorted { $0 > $1 }


let digitNames = [
    0 : "Zero" , 1 : "One" , 2: "Two" , 3: "Three" , 4 : "Four",
    5 : "Five" , 6 : "Six" , 7: "Seven",8: "Eight" , 9 : "Nine"
]
let numbers = [16, 58 , 510 ]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
print(strings)

//Capturing Values
func makeIncrementer(forIncrement amount: Int ) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}


let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

//CLOSURES ARE REFERENCE TYPES
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

//Escaping Closures
var completionHandlers : [() -> Void ] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

//AutoClosure
let text:String = "Unal Ozturk"

func normalClosure(customClos:() -> Character) {
    print("Text is First Character \(customClos())")
}

func autoClosure( autoClos: @autoclosure () -> Character) {
    
    print("Text is First Character \(autoClos())")
    
}

normalClosure { () -> Character in
    return text.first! // Text is First Character K
}


autoClosure(autoClos: text.first!)
