//
//  File.swift
//  FoodTracker
//
//  Created by Irena Davy on 10/2/15.
//  Copyright © 2015 Mandi. All rights reserved.
//


import UIKit

class Meal
{
    var name: String
    var photo: UIImage?
    var rating: Int

init?(name: String, photo: UIImage?, rating: Int)
{
    self.name = name
    self.photo = photo
    self.rating = rating
    
    if name.isEmpty || rating < 0
    {
        return nil
    }
    
}
}

