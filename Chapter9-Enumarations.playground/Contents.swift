import UIKit

//Enumerations
enum CompassPoint {
    case north
    case south
    case east
    case west
}

//Multiple Cases a single line
enum Planet {
    case mercury , venus , earth , mars , jupiter , saturn , uranus , neptune
}

var directionToHead = CompassPoint.west
directionToHead = .east

//Matching Enumeration Values with a Switch Statement
directionToHead = .south

switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly Harmless")
default:
    print("Not a safe place for humans")
}

//Iterating over Enumerations Cases
enum Beverage : CaseIterable {
    case coffee,tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for item in Beverage.allCases {
    print(item)
}

//Associated Values
enum Barcode {
    case upc(Int , Int , Int , Int)
    case qrCode(String)
}

var productBarcode  = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("AVCASADASDASD")

switch productBarcode  {
case .upc(let numberSystem, let manufacturer, let product , let check):
    print("UFC: \(numberSystem), \(manufacturer), \(product), \(check)")
case .qrCode(let productCode):
    print("QR Code: \(productCode)")
}

//Easy way
switch productBarcode  {
case let .upc(numberSystem, manufacturer, product ,  check):
    print("UFC: \(numberSystem), \(manufacturer), \(product), \(check)")
case let .qrCode(productCode):
    print("QR Code: \(productCode)")
}


//RAW values
enum Planett: Int {
    case mercury = 1 , venus , earth , mars , jupiter , saturn , uranus , neptune
}

let myPlanet = Planett.earth.rawValue

//Enumeration below with string raw values to represent each direction's name
enum CompassPointt: String {
    case north, south , east , west
}
let sunsetDirection = CompassPointt.west.rawValue


//Initializing from a Raw Value
let possiblePlanet = Planett(rawValue: 7)
print("PossiblePlanet \(possiblePlanet)")

let positionToFind = 11
if let somePlanet = Planett(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly Harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a planet at position \(positionToFind)")
}

//Recursive Enumerations
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression , ArithmeticExpression )
    indirect case multiplication(ArithmeticExpression , ArithmeticExpression )
}

indirect enum ArithmeticExpressionn {
    case number(Int)
    case addition(ArithmeticExpressionn , ArithmeticExpressionn )
    case multiplication(ArithmeticExpressionn , ArithmeticExpressionn )
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

