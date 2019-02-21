import UIKit

//Optional Chaining
//You specify optional chaining by placing a question mark (?) after the optional value on which you wish to call a property, method or subscript if the optional is non-nil.

class Person {
    var residence : Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()
//let roomCount = john.residence!.numberOfRooms //Trigger error because residence is nil

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
}else {
    print("Unable to retrieve the number of rooms.")
}

john.residence = Residence() // now joh.residence is not nill

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
}else {
    print("Unable to retrieve the number of rooms.")
}

//Definin Model Classes for Optional Chaining
class Personn {
    var residencee:  Residencee?
}
class Residencee {
    var rooms = [Room]()
    var numberOfRooms : Int {
        return rooms.count
    }
    
    subscript(i:Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        print("Number of rooms is \(numberOfRooms)")
    }
    var address: Address?
    
}

class  Room {
    let name : String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street : String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
    
}

//Accessing Properties Through Optional Chaining
let johnn = Personn()

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
johnn.residencee?.address = someAddress


func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    return someAddress
}

johnn.residencee?.address = createAddress()
//You can tell that the createAddress() function isn't called, because nothing is printed


//Calling Methods Through Optional Chaining
if johnn.residencee?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

if (johnn.residencee?.address = someAddress) != nil {
    print("It was possible to set the address.")
} else {
    print("It was not possible to set the address.")
}

//Accessing Subscripts Through Optional Chaining
if let firstRoomName = johnn.residencee?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}

johnn.residencee?[0] = Room(name: "Bathroom")


let johnsHouse = Residencee()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
johnn.residencee = johnsHouse

if let firstRoomName = johnn.residencee?[0].name {
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name.")
}

//Accessing Subscripts of Optional Value
var testScores = ["Dave": [86,82,84], "Bev": [79,94,81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
//the "Dave" array is now [91,82,84] and the "Bev" array is now [80,94,81]
print(testScores)


//Linking Multiple Levels of Chaining
if let johnStreet = johnn.residencee?.address?.street {
    print("John's street name is \(johnStreet).")
} else {
    print("Unable to retrieve the address.")
}

let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
johnn.residencee?.address = johnsAddress

if let johnsStreet = johnn.residencee?.address?.street {
    print("John's street name is \(johnsStreet)")
}else {
    print("Unable to retrieve the address.")
}

//Chaining on Methods with Optional Return Values
if let buildingIndentifier = johnn.residencee?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIndentifier).")
}

if let beginsWithThe = johnn.residencee?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else
    {
        print("John's building identifier does not  begin with \"The\".")
    }
}

