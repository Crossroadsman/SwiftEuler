#if os(OSX) || os(iOS) || os(watchOS) || os(tvOS)
import Darwin
#else
import Glibc
#endif
/*
 the import statement is necessary to get pow/sqrt
 */
/*
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
*/

/* 
 Start with round-down sqrt(target) and test value for factor. If factor, test for prime. If prime, return value. -1 until 1 (return nil).
 */

/*
 Right now this has a sucky for loop for testing isPrime()
 */

/*
 Also, this has not been fully tested as it requires > 5 seconds to compute, which is the limit for the IBM Swift Sandbox
 */

func largestPrimeFactor(target: Int) -> Int? {

  var testValue = Int(sqrt(Double(target)))
  
  while testValue > 1 {
    if isFactor(testValue, target: target) {
      if isPrime(testValue) {
        return testValue
      }
    testValue -= 1
    }
    
  }
  return nil
}

func isFactor(testValue: Int, target: Int) -> Bool {
  if (0 == target % testValue) {
    return true
    }
    return false
}

func isPrime(target: Int) -> Bool {
  for (var i = 2; i < Int(Double(target)); i += 1) {
    if isFactor(i, target: target) {
      return true
      }
  }
  return false
}

print(largestPrimeFactor(600851475143))
