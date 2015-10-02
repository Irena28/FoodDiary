//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Irena Davy on 9/29/15.
//  Copyright © 2015 Mandi. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
   func testMealInit()
   {
    let potenialItem = Meal(name: "new meal", photo: nil, rating: 5)
    XCTAssertNotNil(potenialItem)
    
    let noName = Meal(name: "", photo: nil, rating: 0)
    XCTAssertNil(noName, "Empty name is invalid")
    
    let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
    XCTAssertNil(badRating, "Negative rating")
    }
}
