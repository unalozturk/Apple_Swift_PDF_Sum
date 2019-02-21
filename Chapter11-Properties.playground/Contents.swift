import UIKit

//Properties
struct FixedLengthRange {
    var firstValue : Int
    let length : Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)

//the range represents integer values 0, 1, and 2

rangeOfThreeItems.firstValue = 6

//the range now represents integer values 6, 7 and 8


/////////////////////
let rangeOfThreeItemss = FixedLengthRange(firstValue: 0, length: 4)
// this will report an error , even though firstValue is a variable property
//rangeOfThreeItemss.firstValue = 6

class Home {
    var roomCount = 2
}

// Lazy Var
class DataImporter {
    var fileName = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String] ()
}

let manager = DataManager()
manager.data.append("Some Data")
manager.data.append("Some More Data")
//the DataImporter instance for the importer property has npt yet been created

print(manager.importer.fileName)
//the DataImporter instance for the importer property has nw been created

//Computed Properties
struct Point {
    var x = 0.0 , y = 0.0
}

struct Size {
    var width = 0.0 , height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0 , y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0 , y: 15.0 )
print("Initial square center was \(initialSquareCenter.x),\(initialSquareCenter.y) square.origin is now at (\(square.origin.x), \(square.origin.y))")

//Shorthand Setter Declaration
struct AlternativeRect {
    var origin = Point()
    var size   = Size()
    
    var center : Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

//Read-Only Computed Properties
//A computed property with a getter but no setter is known as a READ-ONLY
struct Cuboid {
    var width = 0.0 , height = 0.0 , depth = 0.0
    var volume : Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")


//Property Observers
class StepCounter {
    var totalSteps : Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) stes")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
//About to set totalSteps to 200
//Added 200 steps
stepCounter.totalSteps = 360
//About to set totalSteps to 360
//Added 160 steps
stepCounter.totalSteps = 896


//Type Property Syntax
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty : Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty  = "Some value."
    static var computedTypePorperty : Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty : Int {
        return 27
    }
    class var overrideableComputedTypeProperty : Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty)
//Prints "Some Value"
SomeStructure.storedTypeProperty = "Another Value"
//Prints "Another Value"
print(SomeStructure.storedTypeProperty)
//Prints "6"
print(SomeClass.computedTypeProperty)
//Prints "27"

///////////
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel : Int = 0  {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                //cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                //store this as the new overal maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
//Prints "7"
print(AudioChannel.maxInputLevelForAllChannels)
//Prints "7"

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
//prints "10"
print(AudioChannel.maxInputLevelForAllChannels)
//prints "10"
