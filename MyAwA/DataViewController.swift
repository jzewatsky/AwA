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
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    @objc var dataObject: AnyObject?
    @objc var pageCount = String()
    @objc var arrayCount = String()
    @objc var message = String()
    @objc var imagArray = Array<NSString>()
    @objc var arrayOfImages = Array<NSString>()
    @objc var imageName = String()
    @objc var theStoryName = String()
    @objc var arrayOfText = Array<NSString>()
    @objc var dataObject2: AnyObject?
    @objc let cellIdentifier = "CellIdentifier"
    @objc var textFieldStart = CGRect()
    @objc var tF = UITextField()
    @IBOutlet weak var collectionView: UICollectionView!
    //@IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var storyTextField: UITextField!
    @IBOutlet weak var pageStatus: UILabel!
    @IBOutlet weak var storyTableImage: UIView!
    @objc var startPoint = CGPoint()
    @objc let screenWidth = UIScreen.main.bounds.size.width
    @objc let screenHeight = UIScreen.main.bounds.size.height

    @IBOutlet weak var storyAdd1: UIView!
    @IBOutlet weak var storyName: UITextField!
    @IBOutlet weak var saveAndFinish: UIButton!

    @IBOutlet weak var storyDirections: UILabel!
    @IBOutlet weak var LeftView: UIView!
    @IBOutlet weak var saveAndAdd: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImages()
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotificationExit(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        textFieldStart = storyTextField.frame
        storyTextField.delegate = self
        print("Data createStory: \(mainGlobalArray.createStory)")
            arrayOfText.removeAll(keepingCapacity: true)
            arrayOfImages.removeAll(keepingCapacity: true)
            imagArray.removeAll(keepingCapacity: true)
        //let paths2 = NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true)
        let mainBundlePath = Bundle.main.bundlePath
       // let documentDirectory2 = paths2[0]
        //println("The application directory is \(paths2).")
        let manager2 = FileManager.default
        
        let filesArray2 = try? manager2.contentsOfDirectory(atPath: mainBundlePath)
        print("The directory is \(mainBundlePath) and it has \(filesArray2)")
        for theFiles2 in filesArray2!{
            var fileString = String()
            fileString = theFiles2 
            if (fileString.range(of: "inc_") != nil) {
                //println("match")
                let fileName2 = theFiles2 
                let fullPath2 = URL(fileURLWithPath: mainBundlePath).appendingPathComponent(fileName2)
                //println(fullPath2)
                imagArray.append(fullPath2.path as NSString)
            }
            if URL(fileURLWithPath: theFiles2).pathExtension == "jpg"{
                ////println("match")
                let fileName2 = theFiles2 
                let fullPath2 = URL(fileURLWithPath: mainBundlePath).appendingPathComponent(fileName2)
                ////println(fullPath2)
                imagArray.append(fullPath2.path as NSString)
            }
        }
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectory = paths[0] 
        let manager = FileManager.default
        
        let filesArray = try? manager.contentsOfDirectory(atPath: documentDirectory)
        for theFiles in filesArray!{
            
            if URL(fileURLWithPath: theFiles).pathExtension == "png"{
                //println("match")
                let fileName = theFiles 
                let fullPath = URL(fileURLWithPath: documentDirectory).appendingPathComponent(fileName)
                ////println(fullPath)
                imagArray.append(fullPath.path as NSString)
            }
            //let contentInsets:UIEdgeInsets = UIEdgeInsets.zero
            //scrollView.contentInset = contentInsets
            //scrollView.scrollIndicatorInsets = contentInsets
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    }
    @objc func setupImages(){
        imagArray.removeAll(keepingCapacity: true)
        //let paths2 = NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true)
        let mainBundlePath = Bundle.main.bundlePath
        //let documentDirectory2 = paths2[0]
        //println("The application directory is \(paths2).")
        let manager2 = FileManager.default
        
        let filesArray2 = try? manager2.contentsOfDirectory(atPath: mainBundlePath)
        //println("The directory is \(mainBundlePath) and it has \(filesArray2)")
        for theFiles2 in filesArray2!{
            var fileString = String()
            fileString = theFiles2 
            if (fileString.range(of: "inc_") != nil) {
                //println("match")
                let fileName2 = theFiles2 
                let fullPath2 = URL(fileURLWithPath: mainBundlePath).appendingPathComponent(fileName2)
                //println(fullPath2)
                imagArray.append(fullPath2.path as NSString)
            }
            if URL(fileURLWithPath: theFiles2).pathExtension == "jpg"{
                ////println("match")
                let fileName2 = theFiles2 
                let fullPath2 = URL(fileURLWithPath: mainBundlePath).appendingPathComponent(fileName2)
                ////println(fullPath2)
                imagArray.append(fullPath2.path as NSString)
            }
        }
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectory = paths[0] 
        let manager = FileManager.default
        
        let filesArray = try? manager.contentsOfDirectory(atPath: documentDirectory)
        for theFiles in filesArray!{
            
            if URL(fileURLWithPath: theFiles).pathExtension == "png"{
                //println("match")
                let fileName = theFiles 
                let fullPath = URL(fileURLWithPath: documentDirectory).appendingPathComponent(fileName)
                ////println(fullPath)
                imagArray.append(fullPath.absoluteString as NSString)
            }
           // let contentInsets:UIEdgeInsets = UIEdgeInsets.zero
           //scrollView.contentInset = contentInsets
            //scrollView.scrollIndicatorInsets = contentInsets
        }
        reloadCollectionView()
    }
    @objc func reloadCollectionView(){
        collectionView.reloadData()
        print("reload collection view")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func returnFromStory(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if mainGlobalArray.createStory == true{
            storyAdd1.isHidden = false
            collectionView.isHidden = false
            storyTextField.isHidden = false
            LeftView.isHidden = false
            storyDirections.isHidden = false
            pageStatus.isHidden = true
     
        }
        if mainGlobalArray.createStory == false{
            storyAdd1.isHidden = true
            collectionView.isHidden = true
            storyTextField.isHidden = true
            LeftView.isHidden = true
            storyDirections.isHidden = true
            pageStatus.isHidden = false


        }
        //let center = NotificationCenter.default
        //center.addObserver(self, selector: #selector(DataViewController.keyboardOnScreen(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        //center.addObserver(self, selector: #selector(DataViewController.keyboardOffScreen(_:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
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
        pageStatus.text = "Page \(pageCount) of \(arrayCount)."
        //} else {
          // self.dataImage!.image = nil
        }
    }
    @objc var activeField: UITextField?
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @IBAction func editingBegan(_ sender: UITextField) {
        activeField = sender
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        storyTextField.resignFirstResponder()
        return true
    }
    
    @objc func keyboardNotificationExit(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
            let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
            if (endFrame?.origin.y)! >= UIScreen.main.bounds.size.height {
                self.keyboardHeightLayoutConstraint?.constant = 0.0
            } else {
                self.keyboardHeightLayoutConstraint?.constant = endFrame?.size.height ?? 0.0
            }
            UIView.animate(withDuration: duration,
                           delay: TimeInterval(0),
                           options: animationCurve,
                           animations: { self.view.layoutIfNeeded() },
                           completion: nil)
    }
    }
    @objc func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
            let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
            if (endFrame?.origin.y)! >= UIScreen.main.bounds.size.height {
                self.keyboardHeightLayoutConstraint?.constant = 0.0
            } else {
                self.keyboardHeightLayoutConstraint?.constant = endFrame?.size.height ?? 0.0
            }
            UIView.animate(withDuration: duration,
                                       delay: TimeInterval(0),
                                       options: animationCurve,
                                       animations: { self.view.layoutIfNeeded() },
                                       completion: nil)
        }
    
    
    /*func keyboardOnScreen(_ notification: Notification){
        
        
     
        let info: NSDictionary  = (notification as NSNotification).userInfo! as NSDictionary
        //let kbSize = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size.height
        
        let kbSize = (info.value(forKey: UIKeyboardFrameEndUserInfoKey) as AnyObject).cgRectValue.size
        let contentInsets:UIEdgeInsets  = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        var aRect: CGRect = self.view.frame
        aRect.size.height -= kbSize.height
        startPoint = CGPoint(x: 0.0, y: storyTextField.frame.origin.y)
        textFieldStart = storyTextField.frame
        //you may not need to scroll, see if the active field is already visible
        if (!aRect.contains(storyTextField!.frame.origin) )
        
        {
            
            
            
            let scrollPoint:CGPoint = CGPoint(x: 0.0, y: self.view.center.y)
          
           scrollView.setContentOffset(scrollPoint, animated: true)
        }
       */
   
    }
    
    
   /* func keyboardOffScreen(_ notification: Notification){
        let contentInsets:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
        

    }*/
    @objc func numberOfSectionsInCollectionView(_ collectionView: UICollectionView) -> Int {

        return 1
        
    }
    @objc func collectionView(_ collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int
    {
        
        return imagArray.count
        
    }
    
    
    @objc func collectionView(_ collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: IndexPath!) -> UICollectionViewCell!
    {

            
            let cellAdd = collectionView.dequeueReusableCell(withReuseIdentifier: "storyCell", for: indexPath) as! addStoryCollectionViewCell
            cellAdd.imageAdd.image = UIImage(named:imagArray[indexPath.row] as String)

            let theSize = CGSize(width: 100, height: 100)
            cellAdd.imageAdd.sizeThatFits(theSize)
            cellAdd.bringSubview(toFront: cellAdd.imageAdd!)
            return cellAdd

    }
    func collectionView(_ collectionView :UICollectionView, didSelectItemAt indexPath: IndexPath){
    self.dataImage!.image = UIImage(named:imagArray[(indexPath as NSIndexPath).row] as String)
        imageName = imagArray[(indexPath as NSIndexPath).row] as String
    
    
    }

    @IBAction func saveAndFinish(_ sender: AnyObject) {
            message = "The story needs a name!"
            alertView()
    }
    @IBAction func saveAndAddFunc(_ sender: AnyObject) {
        arrayOfImages.append(imageName as NSString)
        arrayOfText.append(storyTextField.text! as NSString)
        
        
        clearFields()
    }
    @objc func clearFields(){
        imageName = ""
        storyTextField.text = ""
        dataImage?.image = nil
        pageLabel.text = "Pages in this story: \(arrayOfText.count)"
        
    }
    @objc func whatsInTheField(){
        var match = Bool(false)
        if tF.text == "" {
            message = "The story needs a name!"
            alertView()
        }
        else{
            let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let context:NSManagedObjectContext = appDel.managedObjectContext
            
            //let myRequest = NSFetchRequest(entityName: "StoryArray")
            let myRequest: NSFetchRequest<NSFetchRequestResult> = StoryArray.fetchRequest()

            let sortDescriptor = NSSortDescriptor(key: "storyName", ascending: true)
            //let sortDescriptors = [sortDescriptor]
            myRequest.sortDescriptors = [sortDescriptor]
            myRequest.returnsObjectsAsFaults = false
            
            let results:NSArray = try! context.fetch(myRequest) as NSArray // **** Add code to check name against previously saved names and to save the new story if the name checks out
            
            
            for item in results {
                let testString = (item as AnyObject).value(forKey: "storyName") as? String
                if tF.text!.lowercased() == testString?.lowercased(){
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
    @objc func clearTextField(){
        tF.text = nil
    }
    @objc func saveTheStory(){
        
            arrayOfImages.append(imageName as NSString)
            arrayOfText.append(storyTextField.text! as NSString)
            clearFields()
            
            let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let context:NSManagedObjectContext = appDel.managedObjectContext
        
            let newStory: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory.setValue(tF.text, forKey: "storyName")
            newStory.setValue(arrayOfImages, forKey: "storyImages")
            newStory.setValue(arrayOfText, forKey: "storyText")
            
            do {
                try context.save()
            } catch _ {
            }
            clearTextField()
            self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func alertView(){
        let action : UIAlertController = UIAlertController(title: message, message: "Please type the name of the story below.", preferredStyle: UIAlertControllerStyle.alert)
        
        action.addTextField (configurationHandler: {(textField: UITextField) in
            textField.placeholder = "Story Name..."
            self.tF = textField
            
        })
        
        let done = UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: { alertAction in
            // println("Yes CLICKED")
            self.whatsInTheField()
            
            action.dismiss(animated: true, completion: nil)
            
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
        }
        action.addAction(done)
        action.addAction(cancel)
        self.present(action, animated: true, completion: nil)
    }
    @objc func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory as NSString
    }

    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [AnyHashable: Any]!){
        let selectedImage: UIImage = image
      //println("i've got an image: \(selectedImage)")
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let manager = FileManager.default
        //if let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true) {
        if var paths = Optional(NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)){
            if paths.count > 0 {
                if Optional(paths[0] as String) != nil {
                    //let readPath = NSURL(fileURLWithPath: dirPath).URLByAppendingPathComponent("Image.png")
                   
                    //let image = UIImage(named: readPath)
                 //   //println("selectedImage name: \(selectedImage)")
                   //selectedImage = UIImage(named: readPath)
                    let randomNumber = arc4random()
                    let imageName = "inc_custom_\(randomNumber).png"
                    //let writePath = NSURL(fileURLWithPath: dirPath).URLByAppendingPathComponent(imageName)
                    //var theWritePath = writePath.absoluteString
               //     //println("Path \(writePath)")
                    let writePath = getDocumentsDirectory()
                    //let theImage = UIImagePNGRepresentation(selectedImage)
                    
                    let newImage = "/" + imageName
                    let fullPath = (writePath as String) + newImage
                    
                    if !FileManager.default.fileExists(atPath: fullPath) {
                        if (try? UIImageJPEGRepresentation(selectedImage, 1.0)!.write(to: URL(fileURLWithPath: fullPath), options: [.atomic])) != nil {
                            //////print("file saved")
                            ViewController().getImages(self)
                        
                            
                        } else {
                            //////print("error saving file")
                        }
                    } else {
                        //////print("file already exists")
                    }

                    fileExists = manager.fileExists(atPath: writePath as String)
                      }
        
        self.dismiss(animated: true, completion: nil)
        doWeHaveAFile()
            }
        }
    }
    
    @objc func doWeHaveAFile(){
        print("fileExists?: \(fileExists)")
        if fileExists{
            
            let action : UIAlertController = UIAlertController(title: "Success", message: "The image you selected has been added and is available to be added to the schedule", preferredStyle: UIAlertControllerStyle.alert)
            
            action.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { alertAction in
               // //println("Yes CLICKED")
                action.dismiss(animated: true, completion: nil)
                self.setupImages()
                self.collectionView?.reloadData()
                }))
            self.present(action, animated: true, completion: nil)
            
        }
        else
        {
            let action : UIAlertController = UIAlertController(title: "Error!", message: "The image was not saved.  Please try again.", preferredStyle: UIAlertControllerStyle.alert)
            
            action.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { alertAction in
                // //println("Yes CLICKED")
                action.dismiss(animated: true, completion: nil)
            }))
            self.present(action, animated: true, completion: nil)
        }
    }
    
    @IBAction func addImage(_ sender: AnyObject) {
        
        let action : UIAlertController = UIAlertController(title: "Add an image.", message: "Where do you want to get the image from?", preferredStyle: UIAlertControllerStyle.alert)
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
        action.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.default, handler: { alertAction in
            //println("Yes CLICKED")
            self.getCamera("" as AnyObject)
            action.dismiss(animated: true, completion: nil)
            }))
        }
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
        action.addAction(UIAlertAction(title: "Saved Photos", style: UIAlertActionStyle.default, handler: { alertAction in
            //println("Saved Photos Clicked")
            self.getSavedPhotos("" as AnyObject)
            action.dismiss(animated: true, completion: nil)
            }))
    }
        
        self.present(action, animated: true, completion: nil)
       
    }


    
    @objc func getSavedPhotos(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
            //println("Button capture")
            
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
            imag.allowsEditing = true
            
            self.present(imag, animated: true, completion: nil)
        }
        else{
            //println("SavedPhotosAlbum not available")
        }
    }
    
    @objc func getCamera(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            //println("Button capture")
            
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.camera
            imag.allowsEditing = true
            
            self.present(imag, animated: true, completion: nil)
        }
        else{
            //println("Camera not available")
        }
    }
    
    @objc func getPhotoLibrary(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            //println("Button capture")
            
            let imag = UIImagePickerController()
            imag.delegate = self
            imag.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imag.allowsEditing = true
            
            self.present(imag, animated: true, completion: nil)
        }
        else{
            //println("PhotoLibrary not available")
        }
    }


}

