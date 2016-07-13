//
//  MealListViewController.swift
//  Ratings
//
//  Created by Muzahidul Islam on 7/12/16.
//  Copyright © 2016 iMuzahid. All rights reserved.
//

import UIKit

class MealListViewController: UIViewController {
		var meals = [Meal]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
			loadSampleMeals()
    }

	
	// MARK: Load default sample meal
	
	func loadSampleMeals() {
		let photo1 = UIImage(named: "meal1")!
		let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4)!
		
		let photo2 = UIImage(named: "meal2")!
		let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5)!
		
		let photo3 = UIImage(named: "meal3")!
		let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3)!
		
		meals += [meal1, meal2, meal3]
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
