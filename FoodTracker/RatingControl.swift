//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Irena Davy on 9/30/15.
//  Copyright © 2015 Mandi. All rights reserved.
//

import UIKit

class RatingControl: UIView

{
    //property
    
    var rating = 0
        {
            didSet
            {
                setNeedsLayout()
        }
    }
    
    var spacing = 5
    var stars = 5
    var ratingButtons = [UIButton] ()
    
    
    required init?(coder aDecoder: NSCoder) {
        
        
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage (named: "filledStar")
        let emptyStarImage = UIImage (named: "emptyStar")
        
        
        for _ in 0..<stars
        
        {
            
            
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage((filledStarImage), forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: "ratingButtonTapped:" , forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
            
        }
    }
    

    
    override func layoutSubviews()
        
    {
        
        let buttonSize = Int (frame.size.height)

        var buttonFrame = CGRect (x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for (index, button) in ratingButtons.enumerate()
        {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
           
        }
         updateButtonSelectionStates ()
    }
    
    override func intrinsicContentSize() -> CGSize
    {
        let buttonSize = Int (frame.size.height)
        
        let width = (buttonSize + spacing) * stars
        
        return CGSize (width: width, height: buttonSize)
    }
   //Button action
    
       func  updateButtonSelectionStates ()
    {
        for (index, button) in ratingButtons.enumerate()
        {
            button.selected = index < rating
        }
    }
  
    func ratingButtonTapped (button: UIButton)
        
    {
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
        
    }
    

    
}
