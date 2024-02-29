/*
 Write a function that when given a number >= 0, returns an Array of ascending length subarrays.

 pyramid(0) => [ ]
 pyramid(1) => [ [1] ]
 pyramid(2) => [ [1], [1, 1] ]
 pyramid(3) => [ [1], [1, 1], [1, 1, 1] ]
 Note: the subarrays should be filled with 1s
 */

import Foundation
import XCTest

// MARK: - Pyramid function
func pyramid(_ n: Int) -> [[Int]] {
    var pyramid = [[Int]]()

    guard n > 0 else { return [] }

    for i in 1...n {
        var innerArray = [Int]()
        for _ in 1...i {
            innerArray.append(1)
        }
        pyramid.append(innerArray)
    }

    return pyramid
}

// MARK: - Testing Scenarios
final class SolutionTests: XCTestCase {
    static var allTests = [("pyramid", testSolution)]

    func testSolution() {
        XCTAssertEqual(pyramid(0), [])
        XCTAssertEqual(pyramid(1), [[1]])
        XCTAssertEqual(pyramid(2), [[1], [1, 1]])
        XCTAssertEqual(pyramid(3), [[1], [1, 1], [1, 1, 1]])
    }
}

SolutionTests.defaultTestSuite.run()
