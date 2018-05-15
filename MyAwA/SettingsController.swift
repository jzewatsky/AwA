//
//  SettingsController.swift
//  MyAwA
//
//  Created by Athletes with Autism on 5/25/15.
//  Copyright (c) 2015 Athletes with Autism. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class SettingsController: UIViewController{
    
    @IBOutlet weak var SupportLabel: UILabel!
    @IBOutlet weak var supportView: UIView!
    @IBOutlet weak var Picker: UIPickerView!
    @IBOutlet weak var PickerSegmentedControl: UISegmentedControl!
    @IBOutlet weak var settingsImage: UIImageView!
    @objc var settingsImageString = String()
    @IBOutlet weak var settingsDelete: UIButton!
    @objc var settingsTimeInt = Int()
    @objc var settingsSupport = NSString()
    @objc var StoryResultsArray = NSArray()
    @objc var selectedStory = NSString()
    @IBOutlet weak var TimerLabel: UILabel!
    @objc var SettingsMovieTitles = mainGlobalArray.movieTitles
    @objc var StartingSelectedStory = NSString()
    @objc var settingsTag = Int()
    @IBOutlet weak var timeStepper: UIStepper!
override func viewDidLoad() {
    print("What is the settings tag in Options View? \(settingsTag)")
    timeStepper.value = Double(settingsTimeInt)
    print("image in settings is \(settingsImageString as String)")
    //settingsImage.image = UIImage(contentsOfFile: settingsImageString as String)
    settingsImage.image = UIImage(named: settingsImageString)
    self.preferredContentSize = CGSize(width: 300,height: 600)
    updateTimerLabel()
    //Picker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")

    let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
    let context:NSManagedObjectContext = appDel.managedObjectContext
    
    //let myRequest = NSFetchRequest(entityName: "StoryArray")
    let myRequest: NSFetchRequest<NSFetchRequestResult> = StoryArray.fetchRequest()

    let sortDescriptor = NSSortDescriptor(key: "storyName", ascending: true)
    //let sortDescriptors = [sortDescriptor]
    myRequest.sortDescriptors = [sortDescriptor]
    myRequest.returnsObjectsAsFaults = false
    
    let results:NSArray = try! context.fetch(myRequest) as NSArray
    StoryResultsArray = results
    print("Support view loaded: settingsTimeInt = \(settingsTimeInt) and settingsSupport = \(settingsSupport)")
    StartingSelectedStory = settingsSupport
    if settingsSupport == ""{
        SupportLabel.text = "None"
    }
    if settingsSupport.pathExtension == "mp4"
    {
       
        let finalString = settingsSupport.deletingPathExtension
        let index = finalString.index(finalString.startIndex, offsetBy: 13)
        let theRealFinalString = String(finalString[index...])
        //let theRealFinalString = (finalString.substring(from: finalString.characters.index(finalString.startIndex, offsetBy: 5)))
        let newString = theRealFinalString.replacingOccurrences(of: "*", with: " ", options: NSString.CompareOptions.literal, range: nil)
        SupportLabel.text = newString
    }
    else{
        SupportLabel.text =  settingsSupport as String
    }
    /*if settingsSupport == ""{
        println("settings support is empty")
        supportView.hidden = false
    }
    else{
        supportView.hidden = true
    }*/

}
    @IBAction func timerStepperChange(_ stepper: UIStepper) {
        
        
        // //println("The stepper is at \(stepper.value)")
        minutes = Int(stepper.value / 60)
        minAsSeconds = minutes * 60
        seconds = Int(stepper.value) - minAsSeconds
        // //println("\(minutes):\(seconds)")
        strMinutes = minutes > 9 ? String(minutes): "0" + String(minutes)
        strSeconds = seconds > 9 ? String(seconds): "0" + String(seconds)
        
        TimerLabel.text = "\(strMinutes):\(strSeconds)"
    }
    
    @objc func updateTimerLabel(){
        let myMinutes = settingsTimeInt  / 60
        let myMinAsSeconds = myMinutes * 60
        let mySeconds = settingsTimeInt - myMinAsSeconds
        // //println("\(minutes):\(seconds)")
        let myStrMinutes = myMinutes > 9 ? String(myMinutes): "0" + String(myMinutes)
        let myStrSeconds = mySeconds > 9 ? String(mySeconds): "0" + String(mySeconds)
        TimerLabel.text = "\(myStrMinutes):\(myStrSeconds)"

    }
    @objc func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
        return 1
    }
    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var rowCount = Int()
        if PickerSegmentedControl.selectedSegmentIndex == 0{
        rowCount = StoryResultsArray.count
        }
        if PickerSegmentedControl.selectedSegmentIndex == 1{
            rowCount = 2
        }
        if PickerSegmentedControl.selectedSegmentIndex == 2{
            rowCount = SettingsMovieTitles.count
        }
        return rowCount
    }
    @objc func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.white
        var rowLabel = NSString()
        pickerLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        pickerLabel.textAlignment = NSTextAlignment.center
        if PickerSegmentedControl.selectedSegmentIndex == 0{
            let testrowLabel = (((StoryResultsArray[row]) as AnyObject).value(forKey: "storyName"))
            rowLabel = testrowLabel as! NSString
        }
        if PickerSegmentedControl.selectedSegmentIndex == 1{
                if row == 0
                {
                   rowLabel = "No Change"
                }
                if row == 1
                {
                    rowLabel = "None"
                }
           
        }
        if PickerSegmentedControl.selectedSegmentIndex == 2{
            let MovieRowLabel = SettingsMovieTitles[row] as! String
            //let finalString = NSURL(fileURLWithPath: MovieRowLabel).URLByDeletingPathExtension
         
            
            let removePath = MovieRowLabel.index(MovieRowLabel.endIndex, offsetBy: -4)
            var finalStringString = String(MovieRowLabel[...removePath])
            print("segmentedControl string = \(finalStringString) & MovieRowLabel = \(MovieRowLabel)")
            //finalStringString = finalStringString.stringByDeletingPathExtension
            let characterAt3 = finalStringString.index(finalStringString.startIndex, offsetBy: 3)
            print("character at 3 in string is \(finalStringString[characterAt3])")
            if finalStringString[characterAt3] == "C"{
                print("4th character is c, add Clip to title")
                let clipString = String(" Clip")
                finalStringString = finalStringString + clipString
                
            }
            let advance = finalStringString.index(finalStringString.startIndex, offsetBy: 5)
            let theRealFinalString = String(finalStringString[advance...])
            print("theRealFinalString = \(theRealFinalString)")
            
            //(advanceBy(finalString.startIndex, count))
            //let theRealFinalString = (finalString.substringFromIndex(finalString.startIndex.advancedBy(13)))
            //let newString = theRealFinalString.stringByReplacingOccurrencesOfString("*", withString: " ", options: NSStringCompareOptions.LiteralSearch, range: nil)
            //selectedLabel  = newString
            
            
            //let theRealFinalString = (finalStringString!.substringFromIndex(finalStringString!.startIndex.advancedBy(13)))
            let newString = theRealFinalString.replacingOccurrences(of: "*", with: " ", options: NSString.CompareOptions.literal, range: nil)
            print("newString = \(newString)")
            
            rowLabel = newString as NSString
        }
        pickerLabel.text = rowLabel as String
        return pickerLabel
    }
    /*func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        var rowLabel = NSString()

        return rowLabel as String
    }*/
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        
        switch PickerSegmentedControl.selectedSegmentIndex
        {
        case 0:
            print("Segment 0");
        case 1:
            print("Segment 1");
        case 2:
            print("Segment 2");
        default:
            break;
    }
        Picker.reloadAllComponents()
    }
    @objc func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var selectedLabel = NSString()
        
        if PickerSegmentedControl.selectedSegmentIndex == 0{
           let testLabel = (((StoryResultsArray[row]) as AnyObject).value(forKey: "storyName"))
            print("The story selected is \(String(describing: testLabel))")
            selectedLabel = testLabel as! NSString
            selectedStory = selectedLabel
        }
        if PickerSegmentedControl.selectedSegmentIndex == 1{
            if row == 0
            {
                selectedStory = StartingSelectedStory
                selectedLabel = StartingSelectedStory
            }
            if row == 1
            {
                selectedStory = "None"
                selectedLabel = "None"            }

        }

            if PickerSegmentedControl.selectedSegmentIndex == 2{
            selectedStory = SettingsMovieTitles[row] as! String as NSString
                print("The selected story is: \(selectedStory)")
                var finalString = selectedStory.deletingPathExtension
                let characterAt3 = finalString.index(finalString.startIndex, offsetBy: 3)
                print("character at 3 in string is \(finalString[characterAt3])")
                if finalString[characterAt3] == "C"{
                    print("4th character is c, add Clip to title")
                    let clipString = String(" Clip")
                    finalString = finalString + clipString
                
                }
                let advance = finalString.index(finalString.startIndex, offsetBy: 5)
                let theRealFinalString = String(finalString[advance...])
                
                //(advanceBy(finalString.startIndex, count))
                //let theRealFinalString = (finalString.substringFromIndex(finalString.startIndex.advancedBy(13)))
                let newString = theRealFinalString.replacingOccurrences(of: "*", with: " ", options: NSString.CompareOptions.literal, range: nil)
                selectedLabel  = newString as NSString
            }
        
        print("Picker Selected \(selectedStory)")
        SupportLabel.text = selectedLabel as String
    }
    @IBAction func saveButton(_ sender: UIButton) {
      print("saveButton settingsTag = \(settingsTag)")

        
        if settingsTag > images2.count 

        {
            images2.append(settingsImageString as NSString)
            scheduleSupport.append(selectedStory)
            scheduleTimes.append(Int(timeStepper.value))
        }
else
        {
            settingsTag = settingsTag - 1
            images2[settingsTag] = settingsImageString as NSString
            scheduleSupport[settingsTag] = selectedStory
            scheduleTimes[settingsTag] = Int(timeStepper.value)
        }
        

    }
    @IBAction func deleteButton(_ sender: UIButton) {
        if settingsTag > 1{
        settingsTag = settingsTag - 1
        }
        images2.remove(at: settingsTag)
        scheduleSupport.remove(at: settingsTag)
        scheduleTimes.remove(at: settingsTag)
    
    }
    override func prepare(for segue: (UIStoryboardSegue?), sender: Any!)
    {
        if segue?.identifier == "SaveSettings"{
        images2[settingsTag] = settingsImageString as NSString
        scheduleSupport[settingsTag] = selectedStory
        scheduleTimes[settingsTag] = Int(timeStepper.value)
        OptionsViewController().copyCollectionView?.reloadData()    
    }
        if segue?.identifier == "Exit"{
        
        }
    }
    
}
