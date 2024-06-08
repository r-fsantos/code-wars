
import Foundation
import XCTest

/*
 An Arithmetic Progression is defined as one in which there is a constant difference between the consecutive terms of a given series of numbers. You are provided with consecutive elements of an Arithmetic Progression. There is however one hitch: exactly one term from the original series is missing from the set of numbers which have been given to you. The rest of the given series is the same as the original AP. Find the missing term.

 You have to write a function that receives a list, list size will always be at least 3 numbers. The missing term will never be the first or last one.

    ```
        Example
        find_missing([1, 3, 5, 9, 11]) == 7
    ```

 PS: This is a sample question of the facebook engineer challenge on interviewstreet. I found it quite fun to solve on paper using math, derive the algo that way. Have fun!
 */

func find_missing(l:[Int]) -> Int {
    let first = l.first ?? 0
    let last = l.last ?? 0

    // PA formula for adding n terms: Sn = n * (a1 + an) / 2
    // sums all the expected terms including the missing one
    let correctSum = ((l.count + 1) * (first + last)) / 2

    // the "incorrectSum" doesn't contains the missing term
    let incorrectSum = l.reduce(0, +)

    let missing = correctSum - incorrectSum

    return missing
}

// MARK: - TestClass
final class SolutionTests: XCTestCase {
    static var allTests = [("solution", testSolution)]

    func testSolution() {
        XCTAssertEqual(find_missing(l: [-1, -7, -10, -13, -16, -19, -22, -25, -28]), -4)
        XCTAssertEqual(find_missing(l: [-13, 5, 14, 23, 32, 41, 50, 59, 68]), -4)
        XCTAssertEqual(find_missing(l: [1, 2, 3, 4, 6, 7, 8, 9]), 5)
        XCTAssertEqual(find_missing(l: [-1, 2, 5, 8, 11, 14, 17, 20, 26]), 23)
        XCTAssertEqual(find_missing(l: [1, -2, -5, -8, -14, -17, -20, -23, -26]), -11)
        XCTAssertEqual(find_missing(l: [12, 4, -4, -12, -20, -28, -44, -52, -60]), -36)
    }
}

SolutionTests.defaultTestSuite.run()
