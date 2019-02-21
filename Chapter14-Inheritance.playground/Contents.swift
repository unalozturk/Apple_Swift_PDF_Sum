import UIKit

//Inheritance

//Base Class
//Any class that does not inherit from another class is known as a base class
class Vehicle {
    var currentSpeed = 0.0
    var description : String {
        return "travelling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise()  {
        //do nothing
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")
//Vehicle : travelling at 0.0 miles per hour

//SubClassing
class Bicycle : Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem : Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")


//Overriding
class Train : Vehicle {
    override func makeNoise() {
         print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

class Car : Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}


let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

//Overriding Property Observer
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0 ) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

//Preventing Overrides
//Yu can prevent a method , property , or subscript from being overriden by marking it as final (such as final var , final func , final class func, and final subscript)


