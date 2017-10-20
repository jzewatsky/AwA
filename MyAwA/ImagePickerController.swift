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
    
        
    
    @objc func getSavedPhotos(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
            //println("Button capture")
            
            let imag = UIImagePickerController()
            imag.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
            imag.allowsEditing = true
            //imag.delegate = self
            self.present(imag, animated: true, completion: nil)
        }
        else{
            //println("SavedPhotosAlbum not available")
        }
    }
    
    @objc func getCamera(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            //println("Button capture")
            
            let imag = UIImagePickerController()
            imag.sourceType = UIImagePickerControllerSourceType.camera
            imag.allowsEditing = true
            
            self.present(imag, animated: true, completion: nil)
        }
        else{
            //println("Camera not available")
        }
    }
    
    @objc func getPhotoLibrary(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            //println("Button capture")
            
            let imag = UIImagePickerController()
            imag.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imag.allowsEditing = true
            
            self.present(imag, animated: true, completion: nil)
        }
        else{
            //println("PhotoLibrary not available")
        }
    }
        
}
