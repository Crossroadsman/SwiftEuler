// This doesnt work yet
import Foundation

/*:
 Problem 9: Special Pythagorean triplet
 ======================================
 
 A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 
 a2 + b2 = c2
 For example, 32 + 42 = 9 + 16 = 25 = 52.
 
 There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 Find the product abc.
 */


// a + b + c = 1000
// a, b, c must all be +ve integers
// therefore c must be between 1 and 998
// c^2 must be the sum of the squares of two integers


// Note we've tested every value of c with no results. Therefore the answer must be a case where there are multiple sums of 2 squares and the answer lies in one of the multiples that is not tested.

var a, b, c: Int

var solutionFound = false

c = 1

/**
 - parameter n: Int: the number to check if is square
 - returns: Bool : true if square, else false
 */
func isSquare(n: Int) -> Bool {
    let rootN = sqrt(Double(n))
    let rootNAsInt = Int(rootN)
    if rootNAsInt * rootNAsInt == n {
        return true
    } else {
        return false
    }
    
}

/**
 - parameter n: Int: the number to check if is sum of two squares
 - returns: Bool : true if sum of two squares, else false
 */
func isSumOfTwoSquares(n: Int) -> Bool {
    
    return aAndBSumOfTwoSquares(n) != nil
}

func aAndBSumOfTwoSquares(n: Int) -> (a: Int, b: Int)? {
    
    let first: Int
    let second: Int
    
    guard n > 1 else {
        return nil
    }
    
    guard !isSquare(n - 1) else {
        first = 1
        second = n - 1
        return (first, second)
    }
    
    var a = 2
    var aS: Int {
        return a * a
    }
    
    while Double(a) < sqrt(Double(n)) {
        
        if isSquare(n - aS) {
            first = a
            second = Int(sqrt(Double(n - aS)))
            return (first, second)
        }
        
        a += 1
        
    }
    
    return nil

    
}

/*
isSumOfTwoSquares(1)
isSumOfTwoSquares(2) // 1 + 1
aAndBSumOfTwoSquares(2)?.a
aAndBSumOfTwoSquares(2)?.b
isSumOfTwoSquares(3)
isSumOfTwoSquares(4)
isSumOfTwoSquares(5) // 1 + 4
aAndBSumOfTwoSquares(5)?.a
aAndBSumOfTwoSquares(5)?.b
isSumOfTwoSquares(6)
isSumOfTwoSquares(7)
isSumOfTwoSquares(8) // 4 + 4
aAndBSumOfTwoSquares(8)?.a
aAndBSumOfTwoSquares(8)?.b
*/

while solutionFound == false {
    print("loop starting")
    let cS = c * c
    
    guard c <= 998 else {
        print("error, c == 998 exceeded")
        break
    }
    
    guard aAndBSumOfTwoSquares(cS) != nil else {
        c += 1
        print("c: \(c)")
        print("c^2 is not a sum of two squares")
        continue
    }
    
    let (aS, bS) = aAndBSumOfTwoSquares(cS)!
    let a = Int(sqrt(Double(aS)))
    let b = Int(sqrt(Double(bS)))
    print("a: \(a)")
    print("b: \(b)")
    print("c: \(c)")
    
    if a + b + c == 1000 {
        solutionFound = true
        print("a: \(a), b: \(b), c: \(c)")
    } else {
        c += 1
    }

    
}

print("finished")
