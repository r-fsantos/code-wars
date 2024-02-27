/**
 Write a function that takes an array of numbers (integers for the tests) and a target number. It should find two different items in the array that, when added together, give the target value. The indices of these items should then be returned in a tuple / list (depending on your language) like so: (index1, index2).

 For the purposes of this kata, some tests may have multiple answers; any valid solutions will be accepted.

 The input will always be valid (numbers will be an array of length 2 or greater, and all of the items will be numbers; target will always be the sum of two different items from that array).

 Based on: http://oj.leetcode.com/problems/two-sum/
 */

import Foundation
import XCTest

class Solution {
    static func twosum(numbers: [Double], target: Double) -> [Int] {
        [1, 2]
    }
}

let numbers = [35, 54, 24, 1]
let target = 59
let numbersCount = numbers.count

for (index, number) in numbers.enumerated() {
    if index + 1 < numbersCount {
        let next = index + 1

        if number + numbers[next] == target {
            print("oi, \(number + numbers[index + 1])")
        }
    }
}

// MARK: - Tests

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test 1 - [1,54,24,35], 59 -> [2,3]", test1)
    ]

    static func test1() {
        let actual = [2,3]
        XCTAssertEqual(actual, Solution.twosum(numbers: [1,54,24,35], target: 59))
    }
}

SolutionTest.test1()

//XCTMain([
//    testCase(SolutionTest.allTests)
//])
