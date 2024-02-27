import Foundation
import XCTest

// MARK: - Criteria of acceptance
/// 1 - ✅ length and width must be positve integers. Otherwhise the function returns nil
/// 2-

func sqInRect(_ lng: Int, _ wdth: Int) -> [Int]? {
    var length = lng
    var width = wdth
    var solution: [Int] = []

    if length <= 0 || width <= 0 || length == width {
        return nil
    }

    while (length > 0 && width > 0) {
        solution.append(length > width ? width : length)
        if length > width {
            length -= width
        } else {
            width -= length
        }
    }

    return solution
}

final class SolutionTests: XCTestCase {
    static var allTests = [
        ("sqInRect", testExample),
    ]

    func testing(_ lng: Int, _ wdth: Int, _ expected: [Int]?) {
        XCTAssert(sqInRect(lng, wdth)! == expected!, "should return \(expected!)")
    }
    func testingNil(_ lng: Int, _ wdth: Int) {
        XCTAssertTrue(sqInRect(lng, wdth) == nil, "Should return nil")
    }

    func testExample() {
        testingNil(-1, 4)
        testingNil(4, -1)
        testingNil(0, 4)
        testingNil(4, 0)
        testingNil(0, 0)
        testing(5, 3, [3, 2, 1, 1])
        testing(3, 5, [3, 2, 1, 1])
        testingNil(5, 5)
        testing(20, 14, [14, 6, 6, 2, 2, 2])
    }
}

SolutionTests.defaultTestSuite.run()

