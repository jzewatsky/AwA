//
//  ImagePickerController.swift
//  MyAwA
//
//  Created by Athletes with Autism on 8/8/15.
//  Copyright (c) 2015 Athletes with Autism. All rights reserved.
//

import Foundation
import UIKit

class imagePickerController: UIViewController, UIImagePickerControllerDelegate {
    
        
    
    func getSavedPhotos(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            //println("Button capture")
            
            var imag = UIImagePickerController()
            imag.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
            imag.allowsEditing = true
            imag.delegate = self
            self.presentViewController(imag, animated: true, completion: nil)
        }
        else{
            //println("SavedPhotosAlbum not available")
        }
    }
    
    func getCamera(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            //println("Button capture")
            
            var imag = UIImagePickerController()
            imag.sourceType = UIImagePickerControllerSourceType.Camera
            imag.allowsEditing = true
            
            self.presentViewController(imag, animated: true, completion: nil)
        }
        else{
            //println("Camera not available")
        }
    }
    
    func getPhotoLibrary(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            //println("Button capture")
            
            var imag = UIImagePickerController()
            imag.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imag.allowsEditing = true
            
            self.presentViewController(imag, animated: true, completion: nil)
        }
        else{
            //println("PhotoLibrary not available")
        }
    }
        
}