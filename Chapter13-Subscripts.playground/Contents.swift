import UIKit

//Subscripts
//Classes, structures,and enumerations can define subscripts

//Subscripts Syntax
struct TimesTable {
    let multiplier : Int
    subscript(index:Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[3])")


//Subscript Usage
//The exact meaning of  "subscript" depends on the context in which it is used. Subscripts are typically used as a shortcut for accessing the member elements in a collection, list, or sequence. You are free to implement subscripts in the most appropriate way for your particular class or structure's functionality
struct Matrix {
    let rows : Int , columns: Int
    var grid : [Double]
    init(rows:Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row : Int , column: Int ) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int , column : Int) -> Double {
        get {
            assert(indexIsValid(row: row , column: column), "Index out of range")
            return grid[(row*columns) + column]
        }
        set {
             assert(indexIsValid(row: row , column: column), "Index out of range")
             grid[(row * columns) + column] = newValue
            
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

matrix[0,1] = 1.5
matrix[1,0] = 3.2
print(matrix.grid)

//let someValue = matrix[2,2]
this triggers an assert, because [2,2] is outside of matrix bounds
