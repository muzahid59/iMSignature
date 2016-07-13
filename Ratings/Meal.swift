//
//  Meal.swift
//  Ratings
//
//  Created by Muzahidul Islam on 7/12/16.
//  Copyright © 2016 iMuzahid. All rights reserved.
//

import UIKit

class Meal: NSObject,NSCoding {

	// MARK: Properties
	
	var name: String
	var photo: UIImage?
	var rating: Int
	
	// MARK: Archiving paths
	
	static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
	static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
	
	// MARK: Property keys

	struct PropertyKey {
		static let name = "MealName"
		static let photo = "MealPhoto"
		static let rating = "PhotoRating"
	}
	
	// MARK: Initialization

	init?(name: String, photo: UIImage?, rating: Int) {
		// initialize stored properties
		self.name = name
		self.photo = photo
		self.rating = rating
		
		super.init()
		
		// initialize should be failed if rating less or equal gero or name is empty
		
		if rating <= 0 || name.isEmpty {
			return nil
		}
		
	}
	
	// MARK: NSCoding
	
	func encodeWithCoder(aCoder: NSCoder){
		aCoder.encodeObject(self.name, forKey: PropertyKey.name)
		aCoder.encodeObject(self.photo, forKey: PropertyKey.photo)
		aCoder.encodeInteger(self.rating, forKey: PropertyKey.rating)
	}
	
	required init?(coder aDecoder: NSCoder){
		
		self.name = aDecoder.decodeObjectForKey(PropertyKey.name) as! String
		self.photo = aDecoder.decodeObjectForKey(PropertyKey.photo) as? UIImage
		self.rating = aDecoder.decodeIntegerForKey(PropertyKey.rating) as Int

	}


	
}
