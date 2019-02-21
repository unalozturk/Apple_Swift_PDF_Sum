import UIKit

//Structures And Classes
struct SomeStructure {
    //structure definition goes here
}
class SomeClass {
    //Class definition goes here
}

//Class and Structure Defination
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resulation = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name : String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()


//Accessing Properties
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resulation.width)")

someVideoMode.resulation.width = 1280
print("The width of someVideoMode is \(someVideoMode.resulation.width)")

//Memberwise Initializers for Structure Types
let vga = Resolution(width: 640, height: 480 )
//Classes don't receive a default meberwise


//Structures and Enumerations ARE VALUE TYPES
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048

print("cinema is now \(cinema.width) pixels wide")

print("hd is now \(hd.width) pixels wide")

///////////////
enum CompassPointtt {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPointtt.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")


//Classes ARE REFERENCES TYPES
let tenEighty = VideoMode()
tenEighty.resulation = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEigthy = tenEighty
alsoTenEigthy.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

//Identity Operators

// Identical to (===)
// not identical to (!==)

if tenEighty === alsoTenEigthy {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
