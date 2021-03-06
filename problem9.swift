// all primitive pythagorean triples (PTs) (and some non-primitive ones) can be generated by using the following:

// a = (m^2 - n^2)
// b = 2mn
// c = (m^2 + n^2)

// where: n < m and n, m are both positive integers

// to find the triple such that a + b + c = 1000

/**
will return the product of a*b*c for the triple where a+b+c = 1000
*/
func findTheTriple() -> Int {

  // 1. start with the lowest possible triple
  var n = 1
  var m = 2

  var a: Int {
    return (m * m) - (n * n)
  }
  var b: Int {
    return 2 * m * n
  }
  var c: Int {
    return (m * m) + (n * n)
  }

  var sumOf: Int {
    return a + b + c
  }

  while true {
    // 2. determine if correct form
    print("a: \(a)")
    print("b: \(b)")
    print("c: \(c)")
    print("sumOf: \(sumOf)")
    
    while sumOf <= 1000 {

      if 1000 % sumOf == 0 {
        // 1000 is a multiple (i.e., form) of the current triple
        let multiplier = 1000 / sumOf
        let newA = a * multiplier
        let newB = b * multiplier
        let newC = c * multiplier

        return newA * newB * newC
      } 

      // 1000 is not a multiple (therefore not of the form) of the current triple
      m += 1
    }

    n += 1
    m = n + 1
  }
  
  

}


print(findTheTriple())
