import UIKit

//Multiline String
let quotation = """
    The White Rabbit put on his spectacles. "Where shall I ,
        begin,
please your Majesty?" he asked.
"""

let softWreppedQuotation = """
The White Rabbit put on his spactacles."Where shall I
    begin," \
please your Majesty?" he asked.
"""

let dollarSign = "\u{24}" // $ , Unicode scalar U+0024


//Initializing an Empty String
var emptyString = "" // empty string literal
var anotherEmptyString = String()
//these two strings are both empty, and are equivalent to each other


//Find out whether a String value is Empty
if emptyString.isEmpty {
    print("Nothing to see here")
}

//String Mutability
var variableString = "Horse"
variableString += "and carriage"

////**** Strings Are VALUE TYPES , if you create a new string value, that String value is copied when it's passed to a function or method


//Working with Characters
for character in "Dog!!" {
    print(character)
}

let catCharacters : [Character] = ["C","a","t","!"]
let catString = String(catCharacters)
print(catString)

//String Append
var helloString = "Hello"
let explamationMark : Character = "!"
helloString.append(explamationMark)


//String Interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//Counting Characters
let unusualMenagerie = "Koala 231231412411"
print("unusualMenagerie has \(unusualMenagerie.count)")

//Accessing and Modifiying Text
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
//G

greeting[greeting.index(before: greeting.endIndex)]
//!

greeting[greeting.index(after: greeting.startIndex)]
//u

let index = greeting.index(greeting.startIndex, offsetBy : 7)
greeting[index]

//String Indices
for index in greeting.indices {
    print("\(greeting[index])",terminator:"")
}

//ınsterting and Removing
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))


//Substrings
let greetingg = "Hello, world!"
let indexx = greetingg.firstIndex(of: ",") ?? greetingg.endIndex
let beginning = greetingg[..<indexx]

//Comparing String
let quotationn = "We're a lot"
let someQuotation = "We're a lot"
if quotationn == someQuotation {
    print("They are same")
}

//Prefix and Suffix
let romeoAndJuliet = [
    "Act 1 Scene 1 : Verona , A public place",
    "Act 1 Scene 2 : Capulet's mansion",
    "Act 1 Scene 3 : A room Capulet's mansion"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1;
    }
}
var placeCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("place") {
        placeCount += 1;
    }
}
