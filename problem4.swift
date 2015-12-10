//The largest number that can be made by multiplying two three-digit numbers is 999 * 999 == 998,001
// everything about this implementation sucks

func largestPalindrome(num: Int) -> Int {
    var a = num
    var b = num
    var max = 0
    while a >= 100 {
        b = a
        while b >= 100 {
            print("a: \(a)")
            print("b: \(b)")
            let n = a * b
            if (isPalindrome(intToArray(n))) {
                if n > max {
                    max = n
                }
                
            }
            b -= 1
        }
        a -= 1
        
    }
    return max
}

func intToArray(n: Int) -> [Int] {
    /*
    Turn the characters in the Int into an array
    */
    let asString = String(n)
    let asArray = Array(asString.characters)
    let digits:[Int] = asArray.map {Int(String($0))!}
    return digits
}

func isPalindrome(n: [Int]) -> Bool {
    /*
    If len(array) == 1, return true
    remove first and last characters from the array and compare. If same, run isPalindrome on the remaining array
    if not same, return false
    */
    if (1 == n.count) {
        return true
    }
    var array = n
    let first = array.removeAtIndex(0)
    let last = array.removeLast()
    if (first == last) {
        if (0 == array.count) {
            return true
        }
        return isPalindrome(array)
    }
    return false
}

print(largestPalindrome(999))
