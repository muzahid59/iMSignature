//
//  RatingsTests.swift
//  RatingsTests
//
//  Created by Muzahidul Islam on 7/12/16.
//  Copyright © 2016 iMuzahid. All rights reserved.
//

import XCTest
@testable import Ratings

class RatingsTests: XCTestCase {
	var mealListVC: MealListViewController!
	
    override func setUp() {
        super.setUp()
			let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
			mealListVC = storyboard.instantiateViewControllerWithIdentifier("MealListVC") as! MealListViewController
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testLoadSampleMeal()  {
		
		// before viewdid load called
		
		let meals = mealListVC.meals
		XCTAssert(meals.isEmpty, "Empty meal")
		
		// after viewdid load called
		let _ = mealListVC.view
	
		XCTAssert(mealListVC.meals.count > 0, "Meal load successfully")
		
	}
	
	func testMealInitialization()  {
		// success case
		let potentialMeal = Meal(name: "Demo Name", photo: nil, rating: 5)
		XCTAssertNotNil(potentialMeal, "Successfully Initialize")
		
		// empty name
		let emptyName = Meal(name: "", photo: nil, rating: 5)
		XCTAssertNil(emptyName, "Name is empty")
		
		// rating problem
		let ratingProblem = Meal(name: "Demo Name", photo: nil, rating: 0)
		XCTAssertNil(ratingProblem, "Rating problem")
		
	}
	
	
	
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
