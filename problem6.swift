/*
Sum square difference

The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^2 = 3025

The difference is 3025-385 = 2640

Find the difference between the sum of the squares of the first 100 natural numbers and the square of the sum.
*/

func squareDifference(n: Int) -> Int {

    return squareOfSum(n) - sumOfSquares(n)


}

func makeArray(n: Int) -> [Int] {

    var array: [Int] = []
    for i in range (1...n) {
        array.append(i)
    }
    return array
}


func squareOfSum(n: Int) -> Int {

    let array = makeArray(n)
    
    return array.map({$0 * $0})
}

func sumOfSquares(n: Int) -> Int {

    let array = makeArray(n)
    let sumOfElements = array.reduce(0, +)
    return sumOfElements * sumOfElements

}

squareDifference(10)
