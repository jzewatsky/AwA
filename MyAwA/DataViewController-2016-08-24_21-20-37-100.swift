//
//  DataViewController.swift
//  page view
//
//  Created by Athletes with Autism on 7/28/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//

import CoreData
import Foundation
import UIKit


class DataViewController: UIViewController, UICollectionViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
                            
    @IBOutlet weak var pageLabel: UILabel!
    @IBOutlet weak var dataImage: UIImageView?
    @IBOutlet var dataLabel: UILabel?
    var dataObject: AnyObject?
    var message = String()
    var imagArray = Array<NSString>()
    var arrayOfImages = Array<NSString>()
    var imageName = String()
    var theStoryName = String()
    var arrayOfText = Array<NSString>()
    var dataObject2: AnyObject?
    let cellIdentifier = "CellIdentifier"
    var textFieldStart = CGRect()
    var tF = UITextField()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var storyTextField: UITextField!
    @IBOutlet weak var storyTableImage: UIView!
    var startPoint = CGPoint()
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    let screenHeight = UIScreen.mainScreen().bounds.size.height

    @IBOutlet weak var storyAdd1: UIView!
    @IBOutlet weak var storyName: UITextField!
    @IBOutlet weak var saveAndFinish: UIButton!

    @IBOutlet weak var storyDirections: UILabel!
    @IBOutlet weak var LeftView: UIView!
    @IBOutlet weak var saveAndAdd: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImages()
        textFieldStart = storyTextField.frame
        storyTextField.delegate = self
        print("Data createStory: \(mainGlobalArray.createStory)")
            arrayOfText.removeAll(keepCapacity: true)
            arrayOfImages.removeAll(keepCapacity: true)
            imagArray.removeAll(keepCapacity: true)
        let paths2 = NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true)
        let mainBundlePath = NSBundle.mainBundle().bundlePath
        let documentDirectory2 = paths2[0] 
        //println("The application directory is \(paths2).")
        let manager2 = NSFileManager.defaultManager()
        
        let filesArray2 = try? manager2.contentsOfDirectoryAtPath(mainBundlePath)
        print("The directory is \(mainBundlePath) and it has \(filesArray2)")
        for theFiles2 in filesArray2!{
            var fileString = String()
            fileString = theFiles2 
            if (fileString.rangeOfString("inc_") != nil) {
                //println("match")
                let fileName2 = theFiles2 
                let fullPath2 = NSURL(fileURLWithPath: mainBundlePath).URLByAppendingPathComponent(fileName2)
                //println(fullPath2)
                imagArray.append(fullPath2.path!)
            }
            if NSURL(fileURLWithPath: theFiles2).pathExtension == "jpg"{
                ////println("match")
                let fileName2 = theFiles2 
                let fullPath2 = NSURL(fileURLWithPath: mainBundlePath).URLByAppendingPathComponent(fileName2)
                ////println(fullPath2)
                imagArray.append(fullPath2.path!)
            }
        }
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = paths[0] 
        let manager = NSFileManager.defaultManager()
        
        let filesArray = try? manager.contentsOfDirectoryAtPath(documentDirectory)
        for theFiles in filesArray!{
            
            if NSURL(fileURLWithPath: theFiles).pathExtension == "png"{
                //println("match")
                let fileName = theFiles 
                let fullPath = NSURL(fileURLWithPath: documentDirectory).URLByAppendingPathComponent(fileName)
                ////println(fullPath)
                imagArray.append(fullPath.path!)
            }
            let contentInsets:UIEdgeInsets = UIEdgeInsetsZero
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    }
    func setupImages(){
        imagArray.removeAll(keepCapacity: true)
        let paths2 = NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true)
        let mainBundlePath = NSBundle.mainBundle().bundlePath
        let documentDirectory2 = paths2[0] 
        //println("The application directory is \(paths2).")
        let manager2 = NSFileManager.defaultManager()
        
        let filesArray2 = try? manager2.contentsOfDirectoryAtPath(mainBundlePath)
        //println("The directory is \(mainBundlePath) and it has \(filesArray2)")
        for theFiles2 in filesArray2!{
            var fileString = String()
            fileString = theFiles2 
            if (fileString.rangeOfString("inc_") != nil) {
                //println("match")
                let fileName2 = theFiles2 
                let fullPath2 = NSURL(fileURLWithPath: mainBundlePath).URLByAppendingPathComponent(fileName2)
                //println(fullPath2)
                imagArray.append(fullPath2.path!)
            }
            if NSURL(fileURLWithPath: theFiles2).pathExtension == "jpg"{
                ////println("match")
                let fileName2 = theFiles2 
                let fullPath2 = NSURL(fileURLWithPath: mainBundlePath).URLByAppendingPathComponent(fileName2)
                ////println(fullPath2)
                imagArray.append(fullPath2.path!)
            }
        }
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = paths[0] 
        let manager = NSFileManager.defaultManager()
        
        let filesArray = try? manager.contentsOfDirectoryAtPath(documentDirectory)
        for theFiles in filesArray!{
            
            if NSURL(fileURLWithPath: theFiles).pathExtension == "png"{
                //println("match")
                let fileName = theFiles 
                let fullPath = NSURL(fileURLWithPath: documentDirectory).URLByAppendingPathComponent(fileName)
                ////println(fullPath)
                imagArray.append(fullPath.absoluteString)
            }
            let contentInsets:UIEdgeInsets = UIEdgeInsetsZero
           scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
        reloadCollectionView()
    }
    func reloadCollectionView(){
        collectionView.reloadData()
        print("reload collection view")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func returnFromStory(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if mainGlobalArray.createStory == true{
            storyAdd1.hidden = false
            collectionView.hidden = false
            storyTextField.hidden = false
            LeftView.hidden = false
            storyDirections.hidden = false
     
        }
        if mainGlobalArray.createStory == false{
            storyAdd1.hidden = true
            collectionView.hidden = true
            storyTextField.hidden = true
            LeftView.hidden = true
            storyDirections.hidden = true
            

        }
        let center = NSNotificationCenter.defaultCenter()
        center.addObserver(self, selector: "keyboardOnScreen:", name: UIKeyboardDidShowNotification, object: nil)
        center.addObserver(self, selector: "keyboardOffScreen:", name: UIKeyboardDidHideNotification, object: nil)
        if let obj: AnyObject = dataObject {
            self.dataLabel!.text = obj.description
        } else {
            self.dataLabel!.text = ""
        }
        if let obj2: AnyObject = dataObject2 {
            //NSLog("dataObject2 is: %@", obj2.description)
            let theImage = UIImage(named: obj2.description)
            if theImage != nil{
            self.dataImage!.image = theImage! as UIImage
            }
        //} else {
          // self.dataImage!.image = nil
        }
    }
    var activeField: UITextField?
    
    @IBAction func editingBegan(sender: UITextField) {
        activeField = sender
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        storyTextField.resignFirstResponder()
        return true
    }

    func keyboardOnScreen(notification: NSNotification){
        let info: NSDictionary  = notification.userInfo!
        let kbSize = info.valueForKey(UIKeyboardFrameEndUserInfoKey)?.CGRectValue.size
        let contentInsets:UIEdgeInsets  = UIEdgeInsetsMake(0.0, 0.0, kbSize!.height, 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        var aRect: CGRect = self.view.frame
        aRect.size.height -= kbSize!.height
        startPoint = CGPointMake(0.0, storyTextField.frame.origin.y)
        textFieldStart = storyTextField.frame
        //you may not need to scroll, see if the active field is already visible
        if (!CGRectContainsPoint(aRect, storyTextField!.frame.origin) )
        
        {
            
            
            
            let scrollPoint:CGPoint = CGPointMake(0.0, self.view.center.y)
          
           scrollView.setContentOffset(scrollPoint, animated: true)
        }
       
   
    }
    
    
    func keyboardOffScreen(notification: NSNotification){
        let contentInsets:UIEdgeInsets = UIEdgeInsetsZero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        scrollView.setContentOffset(CGPointMake(0.0, 0.0), animated: true)
        

    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

        return 1
        
    }
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int
    {
        
        return imagArray.count
        
    }
    
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell!
    {

            
            let cellAdd = collectionView.dequeueReusableCellWithReuseIdentifier("storyCell", forIndexPath: indexPath) as! addStoryCollectionViewCell
            cellAdd.imageAdd.image = UIImage(named:imagArray[indexPath.row] as String)

            let theSize = CGSize(width: 100, height: 100)
            cellAdd.imageAdd.sizeThatFits(theSize)
            cellAdd.bringSubviewToFront(cellAdd.imageAdd!)
            return cellAdd

    }
    func collectionView(collectionView :UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
    self.dataImage!.image = UIImage(named:imagArray[indexPath.row] as String)
        imageName = imagArray[indexPath.row] as String
    
    
    }

    @IBAction func saveAndFinish(sender: AnyObject) {
            message = "The story needs a name!"
            alertView()
    }
    @IBAction func saveAndAddFunc(sender: AnyObject) {
        arrayOfImages.append(imageName)
        arrayOfText.append(storyTextField.text!)
        
        
        clearFields()
    }
    func clearFields(){
        imageName = ""
        storyTextField.text = ""
        dataImage?.image = nil
        pageLabel.text = "Pages in this story: \(arrayOfText.count)"
        
    }
    func whatsInTheField(){
        var match = Bool(false)
        if tF.text == "" {
            message = "The story needs a name!"
            alertView()
        }
        else{
            var appDel:AppDelegate = (UIApplication.sharedApplication().delegate) as! AppDelegate
            var context:NSManagedObjectContext = appDel.managedObjectContext
            
            var myRequest = NSFetchRequest(entityName: "StoryArray")
            let sortDescriptor = NSSortDescriptor(key: "storyName", ascending: true)
            let sortDescriptors = [sortDescriptor]
            myRequest.sortDescriptors = [sortDescriptor]
            myRequest.returnsObjectsAsFaults = false
            
            var results:NSArray = try! context.executeFetchRequest(myRequest) // **** Add code to check name against previously saved names and to save the new story if the name checks out
            
            
            for item in results {
                var testString = item.valueForKey("storyName") as? String
                if tF.text!.lowercaseString == testString?.lowercaseString{
                    print("Match")
                    match = true
                }
            }
            if match == false{
                saveTheStory()
            }
            if match == true{
                message = "The name you selected is already in use, please select another!"
                alertView()
            }
        }

    }
    func clearTextField(){
        tF.text = nil
    }
    func saveTheStory(){
        
            arrayOfImages.append(imageName)
            arrayOfText.append(storyTextField.text!)
            clearFields()
            
            var appDel:AppDelegate = (UIApplication.sharedApplication().delegate) as! AppDelegate
            var context:NSManagedObjectContext = appDel.managedObjectContext
        
            var newStory: AnyObject! = NSEntityDescription.insertNewObjectForEntityForName("StoryArray", inManagedObjectContext: context)
            newStory.setValue(tF.text, forKey: "storyName")
            newStory.setValue(arrayOfImages, forKey: "storyImages")
            newStory.setValue(arrayOfText, forKey: "storyText")
            
            do {
                try context.save()
            } catch _ {
            }
            clearTextField()
            self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    @IBAction func alertView(){
        let action : UIAlertController = UIAlertController(title: message, message: "Please type the name of the story below.", preferredStyle: UIAlertControllerStyle.Alert)
        
        action.addTextFieldWithConfigurationHandler ({(textField: UITextField) in
            textField.placeholder = "Story Name..."
            self.tF = textField
            
        })
        
        let done = UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: { alertAction in
            // println("Yes CLICKED")
            self.whatsInTheField()
            
            action.dismissViewControllerAnimated(true, completion: nil)
            
        })
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
        }
        action.addAction(done)
        action.addAction(cancel)
        self.presentViewController(action, animated: true, completion: nil)
    }
    func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject: AnyObject]!){
        var selectedImage: UIImage = image
      //println("i've got an image: \(selectedImage)")
        let nsDocumentDirectory = NSSearchPathDirectory.DocumentDirectory
        let nsUserDomainMask = NSSearchPathDomainMask.UserDomainMask
        let manager = NSFileManager.defaultManager()
        //if let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true) {
        if var paths = Optional(NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)){
            if paths.count > 0 {
                if let dirPath = Optional(paths[0] as String) {
                    let readPath = NSURL(fileURLWithPath: dirPath).URLByAppendingPathComponent("Image.png")
                   
                    //let image = UIImage(named: readPath)
                 //   //println("selectedImage name: \(selectedImage)")
                   //selectedImage = UIImage(named: readPath)
                    let randomNumber = arc4random()
                    let imageName = "inc_custom_\(randomNumber).png"
                    //let writePath = NSURL(fileURLWithPath: dirPath).URLByAppendingPathComponent(imageName)
                    //var theWritePath = writePath.absoluteString
               //     //println("Path \(writePath)")
                    let writePath = getDocumentsDirectory()
                    let theImage = UIImagePNGRepresentation(selectedImage)
                    
                    let newImage = "/" + imageName
                    let fullPath = (writePath as String) + newImage
                    
                    if !NSFileManager.defaultManager().fileExistsAtPath(fullPath) {
                        if UIImageJPEGRepresentation(selectedImage, 1.0)!.writeToFile(fullPath, atomically: true) {
                            //////print("file saved")
                            ViewController().getImages(self)
                        
                            
                        } else {
                            //////print("error saving file")
                        }
                    } else {
                        //////print("file already exists")
                    }

                    fileExists = manager.fileExistsAtPath(writePath as String)
                    do {
                        let check = try manager.contentsOfDirectoryAtPath(writePath as String)
                        //////print("Path \(writePath) - - \(check)")
                    } catch {
                        //////print("Error getting contents of docDirectory")
                    }            }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        doWeHaveAFile()
            }
        }
    }
    
    func doWeHaveAFile(){
        print("fileExists?: \(fileExists)")
        if fileExists{
            
            let action : UIAlertController = UIAlertController(title: "Success", message: "The image you selected has been added and is available to be added to the schedule", preferredStyle: UIAlertControllerStyle.Alert)
            
            action.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { alertAction in
               // //println("Yes CLICKED")
                action.dismissViewControllerAnimated(true, completion: nil)
                self.setupImages()
                self.collectionView?.reloadData()
                }))
            self.presentViewController(action, animated: true, completion: nil)
            
        }
        else
        {
            let action : UIAlertController = UIAlertController(title: "Error!", message: "The image was not saved.  Please try again.", preferredStyle: UIAlertControllerStyle.Alert)
            
            action.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { alertAction in
                // //println("Yes CLICKED")
                action.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(action, animated: true, completion: nil)
        }
    }
    
    @IBAction func addImage(sender: AnyObject) {
        
        let action : UIAlertController = UIAlertController(title: "Add an image.", message: "Where do you want to get the image from?", preferredStyle: UIAlertControllerStyle.Alert)
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
        action.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default, handler: { alertAction in
            //println("Yes CLICKED")
            self.getCamera("")
            action.dismissViewControllerAnimated(true, completion: nil)
            }))
        }
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
        action.addAction(UIAlertAction(title: "Saved Photos", style: UIAlertActionStyle.Default, handler: { alertAction in
            //println("Saved Photos Clicked")
            self.getSavedPhotos("")
            action.dismissViewControllerAnimated(true, completion: nil)
            }))
    }
        
        self.presentViewController(action, animated: true, completion: nil)
       
    }


    
    func getSavedPhotos(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            //println("Button capture")
            
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
            imag.allowsEditing = true
            
            self.presentViewController(imag, animated: true, completion: nil)
        }
        else{
            //println("SavedPhotosAlbum not available")
        }
    }
    
    func getCamera(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            //println("Button capture")
            
            let imag = UIImagePickerController()
            imag.delegate = self
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
            
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            imag.allowsEditing = true
            
            self.presentViewController(imag, animated: true, completion: nil)
        }
        else{
            //println("PhotoLibrary not available")
        }
    }


}

