//
//  ConverterTest.swift
//  TestExampleTests
//
//  Created by itst on 1/12/2025.
//

import XCTest
@testable import CampusApp


final class ConverterTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBTCtoUSDcoverter() {
        let converter = Converter()
        // Arrange
        let btc = 1.0
        // Act
        let usd = converter.btcToUsd(btc: btc)
        let expected = "30570.70"
        // Assert
        XCTAssertEqual(usd, expected, "Test faild.")
    }
    
    
    func testBTCtoUSDcoverterForNegetive() {
        let converter = Converter()
        // Arrange
        let btc = -5.0
        // Act
        let usd = converter.btcToUsd(btc: btc)
        let expected = "Please enter a positive number."
        // Assert
        XCTAssertEqual(usd, expected, "Test faild.")
    }
}
