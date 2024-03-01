// MARK: - Instructions
/*
 Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

 For example (Input --> Output):

 ```
    39 --> 3 (because 3*9 = 27, 2*7 = 14, 1*4 = 4 and 4 has only one digit)
    999 --> 4 (because 9*9*9 = 729, 7*2*9 = 126, 1*2*6 = 12, and finally 1*2 = 2)
    4 --> 0 (because 4 is already a one-digit number)
 ```
 */

import Foundation
import XCTest

// MARK: - Function implementation
func persistence(for num: Int) -> Int {
    var persistence = 0
    var number = num

    while number >= 10 {
        var numberOfDigits = getNumberOfDigits(for: number)
        var numbers = [Int]()
        var divider = exponentiation(10, numberOfDigits - 1)

        for _ in 1...numberOfDigits {
            numbers.append(number / divider)
            number %= divider
            divider /= 10
        }

        number = numbers.reduce(1, *)
        persistence += 1

//        print("numbers: \(numbers)\nnumber: \(number)")
    }
//    print("persistence: \(persistence)")
    return persistence
}

// MARK: - Helper functions
func exponentiation(_ baseNumber: Int = 10, _ exp: Int) -> Int {
    Int(pow(Double(baseNumber), Double(exp)))
}

func getNumberOfDigits(for number: Int, onBase baseNumber: Int = 10) -> Int {
    var numberOfDigits = 0
    while (number / exponentiation(10, numberOfDigits) > 0) {
        numberOfDigits += 1
    }
    return numberOfDigits
}

// MARK: - Another solutions
/// I'v imagined converting the Integer to string, then splitting and create, implement a casting and creating the final array.
/// Then applying the reduce method
func persistenceAlternative(for num: Int) -> Int {
    var persistence = 0

    var numInDigits = getNumInDigits(from: num)

    while numInDigits.count > 1 {
        let numInDigitsProduct = numInDigits.reduce(1, *)
        numInDigits = getNumInDigits(from: numInDigitsProduct)
        persistence += 1
    }

    return persistence
}

func getNumInDigits(from num: Int) -> [Int] {
    String(num).split(separator: "").compactMap { Int(String($0)) }
}

func persistenceRecursive(for num: Int) -> Int {
    let numInDigits: [Int] = String(num).split(separator: "").compactMap { Int(String($0)) }

    return numInDigits.count == 0 ? 0 : 1 + persistenceRecursive(for: numInDigits.reduce(1, *))
}

// MARK: - TestClass
final class SolutionTests: XCTestCase {
    static var allTests = [("solution", testSolution),
                           ("alternativeSolution", testAlternativeSolution),
                           ("persistenceRecursive", testPersistenceRecursive)]

    func testSolution() {
        XCTAssertEqual(persistence(for: 18), 1)
        XCTAssertEqual(persistence(for: 28), 2)
    }

    func testAlternativeSolution() {
        XCTAssertEqual(persistenceAlternative(for: 18), 1)
        XCTAssertEqual(persistenceAlternative(for: 28), 2)
    }

    func testPersistenceRecursive() {
        XCTAssertEqual(persistenceAlternative(for: 18), 1)
        XCTAssertEqual(persistenceAlternative(for: 28), 2)
    }
}

SolutionTests.defaultTestSuite.run()
