/* If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6, 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
*/

// create an array of all natural numbers < 1000
func createArray(n: Int) -> [Int] {
    // There must be a better way to do this that doesn't involve a for-loop
    
    var array: [Int] = []
    for (var i = 1; i < n; i += 1) { // i++ is being deprecated for Swift 3
    
      array.append(i)
    
    }
  return array  
}

// filter array by three then five
func threeAndFive(a: [Int]) -> [Int] {

  let outputArray = a.filter() {0 == $0 % 3 || 0 == $0 % 5}

  return outputArray
}



// reduce the filter
func sumOfItems(a: [Int]) -> [Int] {

  let outputArray = a.reduce(0) {+}

  return outputArray
}

print(sumOfItems(threeAndFive(createArray(1000)))
