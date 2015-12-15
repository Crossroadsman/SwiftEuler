
/*
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder

What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/

func gcd(a: Int, _ b: Int) -> Int {
    
    //Euclidean algorithm
    if (0 == b) {
        return a
    } else {
        return gcd(b, a % b)
    }
    
}

func lcm(a: Int, _ b: Int) -> Int {
    
    // lcm(a,b) = a * b / gcd(a, b)
    return (a * b) / gcd(a, b)
    
}

func lcm(a: [Int]) -> Int {
    
    switch a.count {
    case 0:
        return 0
    case 1:
        return a[0]
    case 2:
        return lcm(a[0], a[1])
    default:
        let newA = a[0]
        let newB = a[1]
        let newLCM = lcm(newA, newB)
        let newArraySlice = a.dropFirst(2)
        var newArray = Array(newArraySlice)
        newArray.insert(newLCM, atIndex: 0)
        return lcm(newArray)
    }
    
}

lcm([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20])
