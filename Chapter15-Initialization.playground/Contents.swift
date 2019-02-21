import UIKit

//Initialization
struct Fahrenheit {
    var temperature : Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature) Fahrenheit")

//Default Property Values
struct Fahrenheitt {
    var temperature = 32.0
    //this is simple struct with default value besides first one
}

//Custom Initialization
struct Celsius {
    var temperatureInCelsius : Double
    init(fromFehrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater =  Celsius(fromFehrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)

/////
struct Color {
    let red, green , blue : Double
    init(red: Double , green: Double, blue: Double) {
        self.red = red
        self.blue = blue
        self.green = green
    }
    
    init(white : Double) {
        red = white
        green = white
        blue = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//Initializer Parameters Without Arguments Labels
struct Celsiuss {
    var temperatureInCelsius : Double
    init(fromFehrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let bodyTemperature = Celsiuss(37.0)

//Optional Property Types
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheseQuestion.ask()
//Prints "Do you like cheese?"
cheseQuestion.response = "Yes, I do like cheese"


//Assigning Constant Properties During Initialization
//For class instance, a constant property can be modified during initialization only by the class that introduces it. It cannot be modified by a subclass
class SurveyQuestionn {
    //text is constant now
    let text: String ///
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion(text: "How about beets?")
beetsQuestion.ask()
//Prints "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"

//Default Initializers
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

//Memberwise Initializers for Structure Types
//Structure types automatically receive a memberwise initializer if they do not feine any of their own custom initializers.
struct Size {
    var width = 0.0 , height = 0.0
}
let twoByTwo = Size(width: 2.0, height: 2.0)


//Initializer Delegation for Value Types

//Initializer can call other initializers to perform part of an instance's initialization. This process, known as initializer delegation, avoids duplicating code across multiple initializers.

// it is different for value and class types. Value types (structures and enumerations ) do not support inheritance.

// For value types, only use self.init to refer to other initializers from same value type when writing your own custom initializers. You can call self.init only from within an initializer.

// Note that if you define a custom initializer for a value type , you will no longer have access to the default initializer (memberwise initializer , if it is a structure) for that type.

struct Sizee {
    var width = 0.0 , height = 0.0
}
struct Pointt {
    var x = 0.0 , y = 0.0
}

struct Rect {
    var origin = Pointt()
    var size = Sizee()
    init() { }
    
    init(origin: Pointt , size: Sizee) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Pointt , size: Sizee) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Pointt(x: originX, y: originY), size: size)
    }
    
}

//The first Rect initializer, init(), is functionally the same as the default initializer that the structure would have received if it did not have its own custom initializers. This initializer has an empty body , represented bu an empty pair of curly braces {}
let basicRect = Rect()
//basicRect's origin is (0.0, 0.0) and its size is (0.0,0.0)


//The second Rect initializer, init(origin:size:), is functionally the same as the memberwise initializer.
let originRect = Rect(origin: Pointt(x: 2.0, y: 2.0), size: Sizee(width: 5.0, height: 5.0))

//The Third Rect initializer , init(center:size:), is slightly more complex.It starts by calculating an appropriate origin point based on a center point and a size value. It then calls (or delegates) to the init(origin:size:) initializer, which stores the new origin and size values in the appropriate properties:
let centerRect = Rect(center: Pointt(x: 4.0 , y: 4.0), size: Sizee(width: 3.0, height: 3.0))
//centerRect's origin is (2.5,2.5) and its size is (3.0,3.0)




//Class Inheritance and Initialization

//Designated Initializer and Convenience Initializers



// Designated initializers are the primary initializers for a class. A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initialization process up the superclass chain.

//Every class must have at least one designated initializer.

// Convenience initializers are secondary , supporting initializers for a class. You can define a convenience initializer to call a designated initializer form the some class as the convenience initializer with some of the designated initializer's paramteres set to default values.

//basically all this means in a nutshell is that you use a convenience initializer to make calling a designated initializer faster and more "convenient". So convenience initializers require the use of self.init instead of something like the super.init that you'd see in an override of a designated initializer.

//You do not have to provide convenience initializers if your class does not require them. Create convenience initializers whenever a shortcut to a common initialization pattern will save time or make initialization of the class clearer in intent.

//The class human has one designated init method and one convenience init method.
class HumanBeing {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "not set")
        // Convenience init call the designated init method
    }
}
let humanBeingObj1 = HumanBeing() // calls convenience init
let humanBeingObj2 = HumanBeing(name: "abhilash") // calls designated init

/*
“To simplify the relationships between designated and convenience initializers, Swift applies the following three rules for delegation calls between initializers:

Rule 1
A designated initializer must call a designated initializer from its immediate superclass.

Rule 2
A convenience initializer must call another initializer from the same class.

Rule 3
A convenience initializer must ultimately call a designated initializer.

A simple way to remember this is:

***Designated initializers must always delegate up.

***Convenience initializers must always delegate across.

*/

//Two-Phase Initialization
//Link : https://medium.com/@shubham.bali7/a-tale-of-two-phase-initialization-in-swift-4-f81ea10fa1a9

//Initializer Inheritance and Overriding
//Unlike subclasses in Objective-C , Swift subclasses do not inherit their superclass initializers bu default.
class Vehicle {
    var numberOfWheels = 0
    var description : String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
//Vehicle : 0 wheel(s)

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")


class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
        // super.init() implicitly called here
    }
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")
// Hoverboard: 0 wheel(s) in a beautiful silver

//Subclasses can modify inherited variable properties during initialization, but can not modify inherited constant properties





//Automatic Initializer Inheritance
//As mentioned above, subclasses do not inherit their superclass initializers by default. However, superclass initializers are automatically inherited if certain condition are met. In practice, this means that you do not need to write initializer overrides in many common scenarios, and can inherit your superclass initializers with minimal effort whenever it is safe to do so.
//Useful article http://basememara.com/swift-class-inheritance/

class Food {
    var name : String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
let namedMeat = Food(name: "Bacon") //Designated //prints namedMeat's name is "Bacon"
let mysteryMeat = Food() // Convenience // prints mysteryMeat's name is "[Unnamed]"

class RecipeIngredient : Food {
    var quantity : Int
    init(name : String , quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
    
}
let oneMysteryItem = RecipeIngredient() //Convenience
let oneBacon = RecipeIngredient(name: "Bacon") //Automatic
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6) //Designated

class ShoppingListItemm : RecipeIngredient {
    var purchased = false
    var description : String  {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔"  : " ✘"
        return output
    }
}

var breakfastList = [
    ShoppingListItemm(),
    ShoppingListItemm(name: "Bacon"),
    ShoppingListItemm(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}
// 1 x Orange juice ✔
// 1 x Bacon ✘
// 6 x Eggs ✘



//Failable Initializers
//You write a failable initializer by placing a question mark after the init keyworkd (init?)
//You cannot define a failable and a nonfailable initializer with the same parameter types and names
struct Animal {
    let species : String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
//someCreature is of type Animal?, not animal


let anonymousCreature = Animal(species: "")
//anonymousCreature is of type Animal? , not animal
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}

//Failable Initializers for Enumerations
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}


let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
     print("This is not defined temperature unit, so initialization failed.")
}


//Failable Initializers for Enumerations with Raw Values
enum TeperatureUnittt: Character {
    case kelvin = "K" , celcius = "C", fahrenheit = "F"
}

let fahrenheitUnitttt = TeperatureUnittt(rawValue: "F")
if fahrenheitUnitttt != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

//Propagation of Initialization Failure
class Productttt {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItemmm: Productttt {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}
//The failable initializer for CartItem starts by validating that it has received a quantity value of 1 or more. If the quantity is invalid, the entire initialization process fails immediately and no further initialization code is executed. Likewise, the failable initializer for Product checks the name value, and the initializer process fails immediately if name is the empty string.”

class Producttttt {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItemmmmm: Producttttt {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

//The failable initializer for CartItem starts by validating that it has received a quantity value of 1 or more. If the quantity is invalid, the entire initialization process fails immediately and no further initialization code is executed. Likewise, the failable initializer for Product checks the name value, and the initializer process fails immediately if name is the empty string.

//If you create a CartItem instance with a nonempty name and a quantity of 1 or more, initialization succeeds:
    
    if let twoSocks = CartItemmmmm(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
// Prints "Item: sock, quantity: 2"

//If you try to create a CartItem instance with a quantity value of 0, initialization will be fall”

//Overriding a Failable Initializer
class Document {
    var name: String?
    // this initializer creates a document with a nil name value
    init() {}
    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

//The init! Failable Initializer
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

//Required Initializers
//Write the required modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer:

class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}

class SomeSubClass: SomeClass {
    required init() {
        //subclass implementation of the required initializer goes here
    }
}

//Setting a Default Property Value with a Closure or Function
struct Chessboard {
    let boardColors : [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
              isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAt(row : Int , column: Int) -> Bool {
        return boardColors[(row*8) + column ]
    }
}

let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
// Prints "true"
print(board.squareIsBlackAt(row: 7, column: 7))
// Prints "false”
