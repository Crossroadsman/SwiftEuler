//The largest number that can be made by multiplying two three-digit numbers is 999 * 999 == 998,001

func largestPalindrome(num: Int) -> Int {
    var n = num
    while n > 0 {
        if (isPalindrome(intToArray(n))) {
            return n
        }
        n -= 1
    }
    return 0
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

print(largestPalindrome(999 * 999))
