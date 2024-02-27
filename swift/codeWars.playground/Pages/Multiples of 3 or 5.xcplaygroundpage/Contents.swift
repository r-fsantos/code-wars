/*

 If we list all the natural numbers below 10 that are multiples of 3 or 5,
 we get 3, 5, 6 and 9. The sum of these multiples is 23.

 Finish the solution so that it returns the sum of all the multiples of 3
 or 5 below the number passed in.

 Additionally, if the number is negative, return 0.

 Note: If the number is a multiple of both 3 and 5, only count it once.

 */

import Foundation
import XCTest

func solution(_ num: Int) -> Int {
    var sum = 0

    guard num > 3 else { return 0 }

    for i in 3..<num {
        if i % 3 == 0 || i % 5 == 0 {
            sum += i
        }
    }

    return sum
}

// MARK: - TestClass
final class SolutionTests: XCTestCase {
    static var allTests = [("solution", testSolution)]

    func testSolution() {
        XCTAssertEqual(solution(-10), 0)
        XCTAssertEqual(solution(0), 0)
        XCTAssertEqual(solution(1), 0)
        XCTAssertEqual(solution(3), 0)
        XCTAssertEqual(solution(5), 3)
        XCTAssertEqual(solution(10), 23)
        XCTAssertEqual(solution(20), 78)
        XCTAssertEqual(solution(200), 9168)
    }
}

SolutionTests.defaultTestSuite.run()

