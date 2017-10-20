//
//  OptionsViewController.swift
//  MyAwA
//
//  Created by Athletes with Autism on 8/8/15.
//  Copyright (c) 2015 Athletes with Autism. All rights reserved.
//

import Foundation
import UIKit



class OptionsViewController: UIViewController, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
@objc var deleteFromBottom = Bool(false)
@objc var setTag = Int()
@objc var imageName = NSString()
@objc var tempTime = Int()
@objc var tempSupport = String()
@IBOutlet var addCollectionView: UICollectionView?
    
@IBOutlet var copyCollectionView: UICollectionView?

@objc let imagePicker = UIImagePickerController()

override func viewDidLoad() {
    super.viewDidLoad()
    //////print("Options viewDidLoad fired")
        NotificationCenter.default.addObserver(self, selector: #selector(OptionsViewController.loadList(_:)), name:NSNotification.Name(rawValue: "load"), object: nil)

    }
@objc func loadList(_ notification: Notification){
    ////print("load List was notified and did fire")
    copyCollectionView!.reloadData()

    }
@objc func numberOfSectionsInCollectionView(_ collectionView: UICollectionView) -> Int {
    var x = Int()
        x = 5
    if collectionView.tag == 3
    {
        x = 1
    }
    return x

    }
    


@objc func collectionView(_ collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int
{

        imageCount = mainArray[section].count
        //imageCount = images.count
        // NSLog("Collection one = %i", images.count)

    if collectionView.tag == 3
    {
        imageCount = images2.count
    }
    return imageCount
    
}

func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView.tag == 3
        {
        //////println("didEndDisplayingCell \(indexPath)")
            let ourCells = collectionView.visibleCells
            for _ in ourCells{
                addStoryCollectionViewCell().startJiggling()
            }
        }
    }

@objc func collectionView(_ collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: IndexPath!) -> UICollectionViewCell!
{
    
    if collectionView.tag == 3
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! OptionsCollectionViewCell
            cell.rightArrow.tag = indexPath.row
            cell.leftArrow.tag = indexPath.row
            cell.rightArrow.isHidden = false
            cell.leftArrow.isHidden = false
            cell.tag = indexPath.row
            cell.imageView!.image = UIImage(named:images2[indexPath.row] as String)
        if indexPath.row == 0{
            cell.leftArrow.isHidden = true
        }
        if indexPath.row == images2.count - 1{
            cell.rightArrow.isHidden = true
        }
        return cell
    }
    if collectionView.tag==1{
        /*var theSectionArray = Array<NSString>()
        let theKey = indexPath.section
        if theKey == 0{
        theSectionArray = schedSection
        }
        if theKey == 1{
        theSectionArray = fmsSection
        }
        if theKey == 2{
        theSectionArray = swimSection
        }
        if theKey == 3{
        theSectionArray = miscSection
        }
        if theKey == 4{
        theSectionArray = customSection
        }*/
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for:indexPath)as! HomeCollectionViewCell
        //////println("The section is \(indexPath.section) at row \(indexPath.row) and it contains \(mainArray[indexPath.section][indexPath.row])")
        //let imageString: String = mainArray[indexPath.section][indexPath.row] as! String
        ////print("imageString = \(imageString) in \([indexPath.section])\([indexPath.row])")
        
        //let theImage = UIImage(named:imageString)
        cell.imageView!.image = UIImage(named: mainArray[indexPath.section][indexPath.row] as! String)
        return cell
    }
    
    else
    { return nil}
    
}
@objc func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {

    var  picDimensionW = Int()
    var  picDimensionH = Int()
    
    if collectionView.tag == 1{
   // collectionView.frame.height
      picDimensionW = 100
      picDimensionH = 100
    }
    if collectionView.tag == 3
    {
        picDimensionW = Int(collectionView.frame.height)
        picDimensionH = Int(collectionView.frame.height)
    }
    return CGSize(width: picDimensionW, height: picDimensionH)
}
/*func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section:Int) -> UIEdgeInsets
{
    var count = CGFloat()
    var inset = UIEdgeInsets()
    var frameWidth = collectionView.frame.width
    
    var cellWidth = CGFloat()
    var top = CGFloat()
    if collectionView.tag==2{
        if section == 0
        {
            top = 0
            cellWidth = 200
            if images2.count > 4
            {
                count = 4
            }
            else
            {
                count = CGFloat(images2.count)
            }
        }
        
        if section == 1
        {
            top = 20
            cellWidth = 50
            count = CGFloat(images2.count - 4)
        }
        
        
        let totalCell = cellWidth * count
        let totalSpace = 10 * count
        let takenSpace = totalCell + totalSpace
        let insetTotal = frameWidth - takenSpace
        let finalInset = insetTotal/2
        ////println("\(cellWidth) * \(count) = \(totalCell)")
        ////println("\(frameWidth) - \(totalCell) = \(insetTotal)")
        ////println("Final Inset = \(finalInset)")
        inset = UIEdgeInsets(top:top, left: finalInset, bottom: 0.0, right:finalInset)
        
    }
    return inset
}
*/

@objc func collectionView(_ collectionView: UICollectionView!, viewForSupplementaryElementOfKind kind: String!,
    atIndexPath indexPath: IndexPath!) -> UICollectionReusableView! {
        if collectionView.tag == 3
        {
            
        }
    var reusableView: UICollectionReusableView? = nil
    let myLabel = UILabel()
    //var labelText = String()
    var labelArray = Array<String>()
    labelArray = ["Schedule", "Swimming", "Fundamental Motor Skills", "Misc.", "Custom"]
    
    if kind == UICollectionElementKindSectionHeader {
        reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier:"headerView", for:indexPath) as UICollectionReusableView
        reusableView?.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        
        
        myLabel.frame = CGRect(x: 10, y: 0, width: 300, height: 30)
        //labelText = labelArray[indexPath.section]
        ////print("Reusuable view section \(indexPath.section) and label \(labelText)")
        if reusableView?.subviews.count == 0{
            reusableView?.addSubview(myLabel)
        }
        myLabel.textColor = UIColor.black
        myLabel.textAlignment = .left
        //myLabel.text = labelText
        let lab = reusableView?.subviews[0] as! UILabel
        lab.text = labelArray[indexPath.section]
    }
    return reusableView
}
func collectionView(_ collectionView :UICollectionView, didSelectItemAt indexPath: IndexPath){

    if collectionView.tag == 3
    {
        imageName = images2[(indexPath as NSIndexPath).row] as NSString
        tempTime = scheduleTimes[(indexPath as NSIndexPath).row]
        tempSupport = scheduleSupport[(indexPath as NSIndexPath).row] as String
        setTag = (indexPath as NSIndexPath).row
        self.performSegue(withIdentifier: "optionsSegue", sender: self)
    }
    if collectionView.tag == 1
    {
    if deleteFromBottom == false{
        let name = mainArray[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row] as! NSString
        //NSLog("The image is named %@", name)
        //images2.append(name)
        //scheduleTimes.append(0)
        //scheduleSupport.append("")
        tempTime = 0
        tempSupport = ""
        setTag = images2.count + 1
        imageName = name
        
        self.performSegue(withIdentifier: "optionsSegue", sender: self)
    }
   if deleteFromBottom == true{
        
        deleteName = mainArray[(indexPath as NSIndexPath).section][(indexPath as NSIndexPath).row] as! String
        deleteIndex = (indexPath as NSIndexPath).row
        ////////println("Ready to delete: \(name)")
        if (deleteName.range(of: "custom") != nil){
            //   //////println("\(deleteName.pathExtension) is equal to png")
            //let nsDocumentDirectory = NSSearchPathDirectory.DocumentDirectory
            //let nsUserDomainMask = NSSearchPathDomainMask.UserDomainMask
            let manager = FileManager.default
            ////////println("Path \(writePath)")
            fileExists = manager.fileExists(atPath: deleteName)
            let action : UIAlertController = UIAlertController(title: "Delete image?", message: "The image is ready to be deleted.  This cannot be undone and this image will no longer be visable in saved schedules", preferredStyle: UIAlertControllerStyle.alert)
            
            action.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { alertAction in
                // //////println("ok CLICKED")
                
                if fileExists{
                    //  //////println("file to delete exists")
                    let manager = FileManager.default
                    do {
                        try manager.removeItem(atPath: deleteName)
                    } catch _ {
                    }
                    if !manager.fileExists(atPath: deleteName){
                        // //////println("File no longer exists")
                        //self.deleteSuccessful()
                        self.addCollectionView?.backgroundColor=UIColor.clear
                        self.deleteFromBottom = false
                        ViewController().getImages(self)
                        self.addCollectionView?.reloadData()
                    }
                }
                action.dismiss(animated: true, completion: nil)
                
            }))
            action.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { alertAction in
                //  //////println("cancel CLICKED")
                self.addCollectionView?.backgroundColor=UIColor.clear
                self.deleteFromBottom = false
                action.dismiss(animated: true, completion: nil)
                self.addCollectionView?.backgroundColor=UIColor.clear
                self.deleteFromBottom = false
                
            }))
            self.present(action, animated: true, completion: nil)
        }
            
        else{
            let action : UIAlertController = UIAlertController(title: "Item not deleted.", message: "This item is part of the default AwA library and cannot be deleted", preferredStyle: UIAlertControllerStyle.alert)
            
            action.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { alertAction in
                // //////println("Yes CLICKED")
                self.addCollectionView?.backgroundColor=UIColor.clear

                action.dismiss(animated: true, completion: nil)
                
            }))
            self.present(action, animated: true, completion: nil)
        }
    }
    }

}

    @IBAction func removeFromCollectionView(_ sender: UIButton) {
        addCollectionView?.backgroundColor=UIColor.red
        deleteFromBottom = true
    }
    @IBAction func AddItem(_ sender: UIButton) {

        
        let action : UIAlertController = UIAlertController(title: "Add an image.", message: "Where do you want to get the image from?", preferredStyle: UIAlertControllerStyle.alert)
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            action.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.default, handler: { alertAction in
                //////println("Yes CLICKED")
                self.getCamera("" as AnyObject)
                action.dismiss(animated: true, completion: nil)
            }))
        }
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
            action.addAction(UIAlertAction(title: "Saved Photos", style: UIAlertActionStyle.default, handler: { alertAction in
                //////println("Saved Photos Clicked")
                self.getSavedPhotos("" as AnyObject)
                action.dismiss(animated: true, completion: nil)
            }))
        }
        
        self.present(action, animated: true, completion: nil)
        
    }
    
    
    
    @objc func getSavedPhotos(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
            //////println("Button capture")
            
           
            let imag = UIImagePickerController()
            imag.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
            imag.allowsEditing = true
            
            imag.delegate = self
            self.present(imag, animated: true, completion: nil)
        }
        else{
            //////println("SavedPhotosAlbum not available")
        }
    }
    
    @objc func getCamera(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            //////println("Button capture")
            
            let imag = UIImagePickerController()
            imag.sourceType = UIImagePickerControllerSourceType.camera
            imag.allowsEditing = true
            imag.delegate = self
            self.present(imag, animated: true, completion: nil)
        }
        else{
            //////println("Camera not available")
        }
    }
    
    @objc func getPhotoLibrary(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            //////println("Button capture")
            
            let imag = UIImagePickerController()
            imag.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imag.allowsEditing = true
            imag.delegate = self
            self.present(imag, animated: true, completion: nil)
        }
        else{
            //////println("PhotoLibrary not available")
        }
    }
    @objc func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory as NSString
    }
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [AnyHashable: Any]!){
        let selectedImage: UIImage = image
        //////println("i've got an image: \(selectedImage)")
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let manager = FileManager.default
        if var paths = Optional(NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)){
            if paths.count > 0 {
                if Optional(paths[0] as String) != nil {
                    //let readPath = NSURL(fileURLWithPath: dirPath).URLByAppendingPathComponent("Image.png")
                    //let image = UIImage(named: readPath)
                    //   //////println("selectedImage name: \(selectedImage)")
                    //selectedImage = UIImage(named: readPath)
                    let randomNumber = arc4random()
                    let imageName = "inc_custom_\(randomNumber).png"
                    //let writePath = NSURL(fileURLWithPath: dirPath).URLByAppendingPathComponent(imageName)
                    //var theWritePath = writePath.absoluteString
                   
                    
                    let writePath = getDocumentsDirectory()
                    //let theImage = UIImagePNGRepresentation(selectedImage)
                    
                    let newImage = "/" + imageName
                    let fullPath = (writePath as String) + newImage
                    
                    if !FileManager.default.fileExists(atPath: fullPath) {
                        if (try? UIImageJPEGRepresentation(selectedImage, 1.0)!.write(to: URL(fileURLWithPath: fullPath), options: [.atomic])) != nil {
                            //////print("file saved")
                            ViewController().getImages(self)
                            self.addCollectionView?.reloadData()

                        } else {
                            //////print("error saving file")
                        }
                    } else {
                        //////print("file already exists")
                    }
                    

        
         
                    
                    fileExists = manager.fileExists(atPath: writePath as String)
                    
                        
                        //let check = try manager.contentsOfDirectoryAtPath(writePath as String)
                        //////print("Path \(writePath) - - \(check)")
                        ViewController().getImages(self)
                        addCollectionView?.reloadData()
                    
                
                }
            }
        }
        ViewController().getImages(self)
        addCollectionView?.reloadData()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func doWeHaveAFile(){
        if fileExists{
            
            let action : UIAlertController = UIAlertController(title: "Success", message: "The image you selected has been added and is available to be added to the schedule", preferredStyle: UIAlertControllerStyle.alert)
            
            action.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { alertAction in
                // //////println("Yes CLICKED")
                action.dismiss(animated: true, completion: nil)
            }))
            self.present(action, animated: true, completion: nil)
        }
        else
        {
            //////println("File Not There!")
        }
    }

    @IBAction func rightButtonPress(_ sender: UIButton) {
        //////print("rightButton \(sender.tag)")
        var tempArray = images2
        tempArray.swapAt(sender.tag, sender.tag + 1)
        images2 = tempArray
        swap(&scheduleTimes[sender.tag], &scheduleTimes[sender.tag + 1])
        swap(&scheduleSupport[sender.tag], &scheduleSupport[sender.tag + 1])
        
        copyCollectionView?.reloadData()
        
    }
    @IBAction func leftButtonPress(_ sender: UIButton) {
        ////print("leftButton \(sender.tag)")
        var tempArray = images2
        tempArray.swapAt(sender.tag, sender.tag - 1)
        images2 = tempArray
        swap(&scheduleTimes[sender.tag], &scheduleTimes[sender.tag - 1])
        swap(&scheduleSupport[sender.tag], &scheduleSupport[sender.tag - 1])
        copyCollectionView?.reloadData()
    }
    override func prepare(for segue: (UIStoryboardSegue!), sender: Any!)
    {
        if segue.identifier == "optionsSegue"{
            
            let Settings = segue.destination as! SettingsController
            let newTag = setTag + 1
            Settings.settingsTag = newTag
            Settings.settingsImageString = imageName as String
            Settings.settingsSupport = tempSupport as NSString
            Settings.settingsTimeInt = tempTime
        }


    }
    @IBAction func unwindToVC(_ segue: UIStoryboardSegue) {
        
    }
    @IBAction func unwindToVCCancel(_ segue: UIStoryboardSegue) {

    }
    @IBAction func unwindToVCDelete(_ segue: UIStoryboardSegue) {
        copyCollectionView?.reloadData()
    }
    @IBAction func unwindToVCSave(_ segue: UIStoryboardSegue) {

        copyCollectionView?.reloadData()
    }
    @IBAction func saveButtonPress(_ sender: UIButton) {
    }
    @IBAction func loadButtonPress(_ sender: UIButton) {
    }
    @IBAction func clearButtonPress(_ sender: UIButton) {
            images2.removeAll(keepingCapacity: true)
            scheduleTimes.removeAll(keepingCapacity: true)
            scheduleSupport.removeAll(keepingCapacity: true)
            mainGlobalArray.tempImages2 = images2
            copyCollectionView!.reloadData()
        
    }
}
