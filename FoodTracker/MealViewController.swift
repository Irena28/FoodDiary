//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Irena Davy on 9/29/15.
//  Copyright © 2015 Mandi. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    //MARK Proporties

    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var photoImageView: UIImageView!
   
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate = self
        
        if let meal = meal
        {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        checkValidMealName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }

 
    
    func textFieldDidBeginEditing(textField: UITextField)
    {
        saveButton.enabled = false
    }
    
    func checkValidMealName()
    {
    
    let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    
    }
    
    
    func textFieldDidEndEditing(textField: UITextField)
    {
    checkValidMealName()
        navigationItem.title = textField.text
        
    }
    
    
    //Mark ImagePickerCotrollerDeligate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        photoImageView.image = selectedImage
        
        dismissViewControllerAnimated(true, completion: nil)

    }
   //Mark Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if saveButton === sender
        {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            meal =  Meal(name: name, photo: photo, rating: rating)
            
        }
    }
    
    
    @IBAction func cancel(sender: UIBarButtonItem)
    
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //Mark Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer)
    {
        nameTextField.resignFirstResponder()
        
        let imagePickerCotroller = UIImagePickerController()
        
        imagePickerCotroller.sourceType = .PhotoLibrary
        
        imagePickerCotroller.delegate = self
        
        presentViewController(imagePickerCotroller, animated: true, completion: nil)
    }
    
    
    }

