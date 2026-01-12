//
//  CampusAppUITests.swift
//  CampusAppUITests
//
//  Created by smalll3b on 6/1/2026.
//

import XCTest

final class CampusAppUITests: XCTestCase {
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let textField = app.textFields["BTC"]
        textField.tap()
        textField.typeText("1")
        let convertButton = app.buttons["Convert"]
        convertButton.tap()
        let resultField = app.staticTexts["result"].label
        XCTAssertEqual(resultField, "30570.70")
    }
    
    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
