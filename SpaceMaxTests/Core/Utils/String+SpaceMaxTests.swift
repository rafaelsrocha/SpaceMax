//
//  String+SpaceMaxTests.swift
//  SpaceMaxTests
//
//  Created by Rafael Rocha on 25.04.23.
//

import XCTest
@testable import SpaceMax

final class String_SpaceMaxTests: XCTestCase {
    func test_parseDateComponents() throws {
        // Given
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let frozenDate = formatter.date(from: "2023-03-18T20:10:37.000Z")!
        // The method is adding 1 year due to SpaceX API being outdated.
        // So here I use the actual SpaceX API value
        let futureDateString: String = "2022-11-01T13:41:00.000Z"
        let expectedComponents: DateComponents = DateComponents(
            day: 227,
            hour: 17,
            minute: 30,
            second: 23
        )
        
        // When
        let actualComponents: DateComponents = try futureDateString.parseDateComponents(from: frozenDate)
        
        // Then
        XCTAssertEqual(expectedComponents.day, actualComponents.day)
        XCTAssertEqual(expectedComponents.hour, actualComponents.hour)
        XCTAssertEqual(expectedComponents.minute, actualComponents.minute)
        XCTAssertEqual(expectedComponents.second, actualComponents.second)
    }
}
