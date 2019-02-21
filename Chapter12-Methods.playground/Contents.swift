import UIKit

//Methods

//Instance Methods
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        
    }
    
    func reset() {
        count = 0
    }
}

let counter = Counter()
//the initial counter value is 0

counter.increment()
//the counter's value is now 1

counter.increment(by: 5)
//the counter's value is now 6

counter.reset()

//Self property
class Counterr {
    var count = 0
    func increment() {
        count += 1
    }
    
    func increment(by amount: Int) {
        
    }
    
    func reset() {
        count = 0
    }
}

struct Point {
    var x = 0.0 , y = 0.0
    
    func isToTheRightOf(x: Double) -> Bool  {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0 ) {
    print("This points is to the right of the line where x == 1.0 ")
}

//Modifying Value Types from Within Instance Methods
//Structures and enumerations are value types. By default , the properties of a value type cannot be modified from within its instance methods.
struct Pointt {
    var x = 0.0 , y = 0.0
    mutating func moveBy(x deltaX:Double , y DeltaY: Double) {
        x += deltaX
        y += DeltaY
    }
}

var somePointt = Pointt(x: 1.0, y: 1.0)
somePointt.moveBy(x: 2.0 , y: 3.0)
print("The point is nıw at (3.0, 4.0)")
//Prints "The point is now at (3.0, 4.0)"


//Assigning to self Within a Mutating Method
struct Pointtt {
    var x = 0.0 , y  = 0.0
    mutating func moveBy(x deltaX:Double , y deltaY:Double) {
        self = Pointtt(x: x + deltaX , y: y + deltaY)
    }
    
}

enum TriStateSwitch {
    case off, low , high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .low
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
//oven light is now equal to  .high
ovenLight.next()
//oven light is now equal to .off




//Type Methods
//To indicate type methods by writing the static keyword before the method's func keyword.
//Class may also use the class keyword to allow subclasses to override the superclass's implementation of that method
//In Objective-C, you can define type-level methods only for Objective-C classes. In Swift, you can define type-level methods for all classes, structures, and enumerations.Each type method is explicitly scoped to the type it supports
// TYPE Methods are called with dot syntax, like instance methods.However, you call type methods on the type , not on an instance of that type, Here's how you call a type method on a class called SomeClass:
class SomeClass {
    class func someTypeMethod() {
        //type method implementation goes here
    }
    
}
SomeClass.someTypeMethod()


struct LevelTracker {
    static var hightesUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > hightesUnlockedLevel {
            hightesUnlockedLevel = level
        
        }
    }
    
    static func isUnlocked(_ level:Int) -> Bool {
        return level <= hightesUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level:Int ) -> Bool {
        if LevelTracker.isUnlocked(level){
            currentLevel = level
            return true
        } else {
            return false
        }
    }
    
    
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level : Int)  {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Unal")
player.complete(level: 1)
print("Highest unlocked level is now \(LevelTracker.hightesUnlockedLevel)")
//Prints "highest unlocked level is now 2"
