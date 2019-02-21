import UIKit

var str = "Hello, playground"

    //#if swift(>= 3.4) pr
print("Hello, world!")
    
var myVariable = 32
    myVariable = 50

let myConstant = 34

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble : Double = 70

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

    
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
    
//Array
var shoppingList = ["catfish", "water","tulips","blue","paint"]
shoppingList[1] = "bottle of water"
print(shoppingList)

var occupations = [
        "Malcolm" : "Captain",
        "Kaylee"  : "Mechanic",
]
occupations["Jayne"] = "Public Relations"
print(occupations)

    
//Empty Array
let emptyArray = [String]()
let emptyDictionary = [String : Float]()

//Empty Array Pass Arguments
shoppingList = []
occupations = [:]
    
//For And IF
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {teamScore += 3 } else {teamScore += 1}
}
print(teamScore)
    
//Optional Comparison
var optionalString : String? = "Hello"
print(optionalString == nil)
    
var optionalName: String? = "Unal Ozturk"
var greeting = "Hello!"
if let name = optionalName {
        greeting = "Hello, \(name)"
}
    
// ?? Usage
let nickName : String? = nil
let fullName : String = "Unal Ozturk"
let informalGreeting = "Hi \(nickName ?? fullName) "
    
//Switch Case
let vegetable = "red pepper"
    switch vegetable {
    case "celery":
        print("A")
    case "cucumber","watercress":
        print("B")
    case let x where x.hasSuffix("pepper"):
        print("Is it a spicy \(x)?")
    default:
        print("C")
    }
    
//Iteration
let insterestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25],
]
var largest = 0
for (kind, numbers) in insterestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            
        }
    }
}
print(largest)
    
//While
var n = 2
while n < 100 {
    n *= 2
}
print(n)
    
var m = 2
repeat {
    m *= 2
} while  m < 100
print(m)
    
//For loop with Range
var total = 0
for i in 0..<4 { total += i }
print(total)
    
var totall = 0
for i in 0...4 { totall += i}
print(totall)



    
//Functions and Closures
func greet(person : String , day: String) -> String {
     return "Hello \(person), today is \(day)."
}
greet(person: "Unal", day: "Çarşamba")
    
func greetNoArgument(_ person : String , day: String) -> String {
        return "Hello \(person), today is \(day)."
}
greetNoArgument("Unal", day: "Çarşamba")


func calculateStatistics(scores : [Int] ) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max { max = score }
        else if score < min { min = score }
        sum += score
    }
    
    return( min, max, sum)
}

let statistics = calculateStatistics(scores: [5,3,100,3,9])
print(statistics.sum)
print(statistics.2)


//Nested Function
func returnFifteen() -> Int {
    var y = 10
    func add() { y += 5}
    add()
    return y
}
returnFifteen()


//Functions are a first-class.This means that a function can return another function as its value.
func makeIncrementer() -> ( (Int) -> Int) {
    func addOne(number : Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)




func hasAnyMatches(list: [Int], condition: (Int) -> Bool ) -> Bool {
    for item in list {
        if condition(item) { return true }
    }
    return false
}
func lessThanTen(number : Int) -> Bool {
    return number < 10
}
var numbers = [20,19,7,12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//Mapping
numbers.map({ (number : Int ) -> Int in
    if (number % 2 == 1 ) { return 0 }
    return number
})

let mappedNumbers = numbers.map({number in 3*number })
print(mappedNumbers)

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)




///Objects and Classes

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
       return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//Class with Initializer
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name : String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
         return "A shape with \(numberOfSides) sides."
    }
}

class Square : NamedShape {
    var sideLength : Double
    
    init(sideLength: Double , name:String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

//Getter and Setter
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
        
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 12.0
print(triangle.sideLength)


//WillSet
class TriangleAndSquare {
    
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square : Square {
        willSet {
            triangle.sideLength = newValue.sideLength
            
        }
    }
    
    init(size : Double , name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

let optionalSquare : Square? = Square(sideLength: 2.5, name: "optional sqaure")
let sideLeght = optionalSquare?.sideLength

//Enumerations and Structures
enum Rank : Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen,king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .three:
            return "three"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades , hearts , diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .clubs:
            return "clubs"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()


enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am","8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise,sunset):
    print("Sunrise is at \(sunrise) and sundet is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
}



//Struct
struct Card {
    var rank : Rank
    var suit : Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//Protocols and Extensions
protocol ExampleProtocol {
    var simpleDescription : String { get }
    mutating func adjust()
}
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty : Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription


struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
         simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//Extension
extension Int: ExampleProtocol {
    var simpleDescription : String {
        return "The number \(self)"
    }
    mutating func adjust() {
         self += 42
    }
}
print(7.simpleDescription)

let protocolValue : ExampleProtocol = a


//Error Handling
enum PrinterError : Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int , toPrinter printerName:String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job Sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
}catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
}catch {
    print(error)
}

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")


var fridgeIsOpen = false
let fridgeContent = ["milk","eggs","leftovers"]

func fridgeContains(_ food:String ) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("banana")
print(fridgeIsOpen)


//Generics
func makeArray<Item>(repeating item: Item , numberOfTimes: Int) -> [Item] {
    var result =  [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger : OptionalValue<Int> = .none
possibleInteger = .some(100)
