import UIKit

//For-In Loops
let names = ["Anna","Alex","Brian","Jack"]

for name in names {
    print("Hello \(name)!")
}

let numberOfLegs = ["spider": 8 , "ant": 6 , "cat": 4]

for (animalName,legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}


for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//________----------_________--
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")


//________----------_________--
let minutes = 60
for tickMark in 0..<minutes {
    //render the tick mark each minute (60 times)
}

//________----------_________--
let minuteInterval = 5
for tichMark in stride(from: 0, to: minutes , by: minuteInterval) {
    //render the tick mark every 5 minutes (0, 5, 10, 15 .... 45, 50 , 55)
}

//________----------_________--
let hours = 12
let hourInterval = 3
for tickMark in stride(from: 3, through: hours , by: hourInterval) {
    //render the tick mark every 3 hours (3, 6, 9, 12)
}


//While Loops
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02

var start : Int = 0;
while start<finalSquare {
    print(start)
    start += 1
}

start = 0
//Repeat-While
repeat {
    print(start)
    start += 1
} while start<finalSquare


//IF
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

//Switch case
let someCharacter : Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}


let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a","A":
    print("The letter A")
default:
    print("Not the letter A")
}


let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String  = ""

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
default:
    naturalCount = "many"
}

//Tuples
let somePoint = (1,1)
switch somePoint {
case (0,0):
    print("\(somePoint) is at the origin")
case (_,0):
    print("\(somePoint) is on the x-axis")
case (0,_):
    print("\(somePoint) is on the y-axis")
case (-2...2,-2...2):
    print("\(somePoint) is on the y-axis")
default:
    print("\(somePoint) is outside of the box")
}

//Value binding
let anotherPoint : (Int,Int) = (2,0)

switch anotherPoint {
case (let x, 0) :
    print("on the x-axis with an x value of \(x)")
case (0, let y) :
    print("on the y-axis with an x value of \(y)")
case (let x , let y) :
    print("somewhere else at \(x) \(y)")
}

//Where
let yetAnotherPoint = (1,-1)
switch yetAnotherPoint  {
case let (x,y) where x == y:
    print("\(x), \(y) is on the line x == y")
case let (x,y) where x == -y:
    print("\(x), \(y) is on the line x == -y")
case let (x,y) :
    print("\(x), \(y) is just some arbitrary point")
}

//Control Transfer Statements

//Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove : [Character] = ["a","e","i","o","u"," "]
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}

var puzzleOutputbreak = ""
for character in puzzleInput {
    if charactersToRemove.contains(character) {
        break
    }
    puzzleOutputbreak.append(character)
}
print(puzzleOutputbreak)

//Fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description) // Prints "The number 5 is a prime number, and also an integer."

//Early Exit
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."



//Check API Availability
if #available(iOS 10, macOS 10.12, *) {
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
}
