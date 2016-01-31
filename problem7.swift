//
//  main.swift
//  primeTool
//
//  Created by Alex Koumparos on 31/01/16.
//  Copyright © 2016 Alex Koumparos. All rights reserved.
//

import Foundation

class PrimeTool {
    var primeSet: [Int] = [2]
    var maxTest = 0
    
    func isPrime(test: Int) -> Bool {
        if primeSet.contains(test) {return true}
        if 2 > test { return false}
        if 2 == test { return true }
        // add cachelogic here
        // run sieve
        for element in Array(2...max(2,Int(pow(Double(test),0.5)))) {
            if 0 == test % element { return false}
            
        }
        primeSet.append(test)
        return true
        
    }
    
    func primeSetReorder() {
        // run this to clean primeSet from time to time
        primeSet.sortInPlace()
    }
    
    func sieve(testSet: [Int], unsorted: Bool = false) -> [Int] {
        var workingSet = testSet
        var tempPrimeSet: [Int] = []
        //By default assumes that the testSet is sorted. If not, it will update its copy of testSet with a sorted version
        if true == unsorted {
            workingSet.sortInPlace()
        }
        
        //remove <2
        while workingSet[0] < 2 {
            workingSet.removeFirst()
        }
        
        
        while workingSet.count > 0 {
            if isPrime(workingSet[0]) {
                workingSet.removeFirst()
                workingSet = workingSet.filter({$0 % workingSet[0] != 0})
                tempPrimeSet.append(workingSet[0])
            }
            
        }
        return tempPrimeSet
        
        
    }
    
    func sieve(numberOfPrimes: Int, sieveSize: Int = 10_000) -> [Int] {
        // sieveSize is necessary to enable sieve approach to prime-finding (i.e., need to have a complete pool of numbers to sieve before can use the sieve approach, otherwise have to use isPrime() method on all numbers
        // default value of 10000 which should be enough for regular use, can override with any value up to 2^64 - 1 (maybe 2^63 - 1 if Int is signed).
        var workingSet: [Int] = Array(2...sieveSize)
        var tempPrimeSet: [Int] = []
        
        
        while workingSet.count > 0 {
            print("starting loop, workingSet.count = \(workingSet.count)")
            if tempPrimeSet.count >= numberOfPrimes {
                return tempPrimeSet
            }
            print("workingSet[0] = \(workingSet[0])")
            if isPrime(workingSet[0]) {
                tempPrimeSet.append(workingSet[0])
                workingSet = workingSet.filter({$0 % workingSet[0] != 0})
                print("done filter, workingSet.count = \(workingSet.count)")
                print("tempPrimeSet.count = \(tempPrimeSet.count)")
                
            }
            else {workingSet.removeFirst()}
        }
        return tempPrimeSet
    }


    
}

let myTest = PrimeTool()

let n = 10_001
let pool = 120_000

let primes = myTest.sieve(n, sieveSize: pool)
print("---------------------------------")
print("number of primes: \(primes.count)")
print("prime n: \(primes[n - 1])")
print("---------------------------------")
