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
    (0..<n).map { Array(repeating: 1, count: $0 + 1) }
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
