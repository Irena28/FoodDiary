//
//  ViewController.swift
//  FoodTracker
//
//  Created by Irena Davy on 9/29/15.
//  Copyright © 2015 Mandi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK Proporties

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameTextField.delegate = self
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

    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
        
    }
    
    
    //Mark ImagePickerCotrollerDeligate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
  
    func imagePickerConroller (picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: AnyObject])
    {
    
    }
    
    //Mark Actions
    
    @IBAction func setDefaultLabelText(sender: UIButton)
    
    {
        mealNameLabel.text = "Default Text"
    }

    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer)
    {
        nameTextField.resignFirstResponder()
        
        let imagePickerCotroller = UIImagePickerController()
        
        imagePickerCotroller.sourceType = .PhotoLibrary
        
        imagePickerCotroller.delegate = self
       
        presentViewController(imagePickerCotroller, animated: true, completion: nil)
    }
}

