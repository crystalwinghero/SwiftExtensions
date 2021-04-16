import XCTest
@testable import SwiftExtensions

final class SwiftExtensionsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        //TODO: add unit tests
        XCTAssert("test_test".preg_match("test"))
        XCTAssert(!"test_test".preg_match("tst"))
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
