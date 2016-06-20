
import Foundation // required for sqrt()

var primesArray: [Int] = []

func allPrimes(to n: Int) -> [Int] {

  guard n > 0 else { return [] }

  var primes = [2]

  guard n > 2 else { return primes}

  for i in stride(from: 3, through: n, by: 2) {
    if isPrime(n: i, cache: primesArray) {
      primes.append(i)
    }
  }

  return primes
  
}

func isPrime(n: Int, cache: [Int]) -> Bool {

  guard !cache.contains(n) else { return true }
  guard n > cache.last else { return false }

  if primeFactorise(n).count > 1 {
    return false
  }

  return true

}

/**
  recursively generates an array of the prime factors of a supplied number
  
  - Parameter n: an Int being the number to be factorised
  - Parameter factorsSoFar: an array of Ints being the factors computed so far
  - Parameter i: the current Int being used as a test divisor
  
  - Returns: an array of Ints being the prime factors sorted from low to high
*/
func primeFactorise(n: Int, factorsSoFar: [Int], i: Int = 2) -> [Int] {
    
    guard n > 0 else {
        return [] // error: can only factorise natural numbers
    }
    
    guard Double(i) <= sqrt(Double(n)) else {
        return factorsSoFar + [n] // no need to check for divisors > sqrt of n, as the counterpart factor will have already been tested
    }
    
    switch n % i == 0 {
        
        case true:
        
            return primeFactorise(n: n / i, factorsSoFar: factorsSoFar + [i])
        
        case false:
        
            return primeFactorise(n: n, factorsSoFar: factorsSoFar, i: i + 1)
    }
    
    
}


/**
  recursively generates an array of the prime factors of a supplied number
  
  - Parameter _ : an Int being the number to be factorised
  
  - Returns: an array of Ints being the prime factors sorted from low to high
*/
func primeFactorise(_ n: Int) -> [Int] {
    return primeFactorise(n: n, factorsSoFar: [])
}

var targetList = allPrimes(to: 2_000_000)

var sumOf = targetList.reduce(0, combine: +)

print(sumOf)
