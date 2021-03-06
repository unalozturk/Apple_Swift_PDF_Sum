import UIKit

//Swift provides three primary collection types,

//1-Arrays (ordered collections of values)
//2-Sets (unordered collections of unique values)
//3-Dictionaries (unordered collections of key-value associations)

//Arrays
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items")
someInts.append(3)
print("someInts is of type [Int] with \(someInts.count) items")
someInts = []
print("someInts is of type [Int] with \(someInts.count) items")

//Creating an Array with a Default Value
var threeDoubles = Array(repeating: 0.0 , count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles

//Creating an Array with an Array Literal
var shoppingList : [String] = ["Eggs", "Milk"]

var shoppingListt = ["Eggs", "Milk"]

if shoppingList.isEmpty {
    print("The shopping list is empty")
} else {
    print("The shopping list is not empty")
}

//Array Appaned
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chesse","Butter"]

var firstItem = shoppingList[0]

shoppingList[0] = "Six eggs"

shoppingList[3...5] = ["Bananas","Apples"]

shoppingList.insert("Maple Syrup", at: 0)

//Array item remove
let mapleSyrup = shoppingList.remove(at: 0)
let apples = shoppingList.removeLast()


//Iteratin Over an Array
for item in shoppingList {
    print(item)
}

//Iteration Array with Index
for (index,value)in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

//Sets
//A type must be HASHABLE in order to be stored in a set
//All of Swift's basic types (such as String, Int, Double and Bool) are hashable by default
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
letters.insert("a")
letters = []

//Creating a Set with an Array Literal
var favoriteGenres : Set<String> = ["Rock","Classical","Hip Hop"]

print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far as music goes , I'm not picky")
} else {
    print("I have particular music preferences")
}

favoriteGenres.insert("Jazz")

//Remove item
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
}else {
    print("I never much cared for that.")
}

//Contains Item
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here")
}

//Iteration
for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}

//Performing Set Operations
let oddDigits: Set = [1,3,5,7,9]
let evenDigits : Set = [0,2,4,6,8]
let singleDigitPrimeNumbers : Set = [2,3,5,7]

oddDigits.union(evenDigits).sorted()
// [0,1,2,3,4,5,6,7,8,9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1,9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1,2,9]

//Set Membership
let houseAnimals : Set = ["🐶","🐱"]
let farmAnimals : Set = ["🐔","🐮","🐶","🐱"]
let cityAnimals : Set = ["🐭","🐦"]

houseAnimals.isSubset(of: farmAnimals)
//true
farmAnimals.isSuperset(of: houseAnimals)
//true
farmAnimals.isDisjoint(with: cityAnimals)
//true



//Dictionaries
var namesOfIntegers = [Int : String ]()

namesOfIntegers[16] = "sixteen"

namesOfIntegers = [:]


var airports: [String : String ] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

print("The airports dictionary contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}

airports["LHR"] = "London"

airports ["LHR"] = "London Hearthrow"



if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That aiprort is not in the airports dictionary.")
}

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}


for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)

let airportNames = [String](airports.values)
