//
//  SaveViewController.swift
//  MyAwA
//
//  Created by Athletes with Autism on 8/1/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//

import CoreData
import UIKit

class SaveViewController: UIViewController {

    @IBOutlet weak var saveTextField: UITextField!
    @IBAction func saveCancel(_ sender: AnyObject) {
         self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveDone(_ sender: AnyObject) {
        
        let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        //let myRequest = NSFetchRequest(entityName: "SavedArray")
        let myRequest: NSFetchRequest<NSFetchRequestResult> = SavedArray.fetchRequest()

        myRequest.returnsObjectsAsFaults = false
        myRequest.predicate = NSPredicate(format:"name = %@", saveTextField.text!)
        
        let results:NSArray = try! context.fetch(myRequest) as NSArray
        
        if (results.count > 0) && (saveTextField.text != "")
        {
            let action : UIAlertController = UIAlertController(title: "Schedule by this name already exists!", message: "Please select a different name", preferredStyle: UIAlertControllerStyle.alert)
            
            action.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: { alertAction in
               // println("Yes CLICKED")
                action.dismiss(animated: true, completion: nil)
                self.saveTextField.text = ""
                }))
            
            self.present(action, animated: true, completion: nil)
            
        }
        else
        {
        mainGlobalArray.saveName = saveTextField.text! as NSString
            let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
            let context:NSManagedObjectContext = appDel.managedObjectContext
            
            let newSchedule: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "SavedArray", into: context)
            newSchedule.setValue(saveTextField.text, forKey: "name")
            newSchedule.setValue(images2, forKey: "array")
            newSchedule.setValue(scheduleTimes, forKey: "times")
            newSchedule.setValue(scheduleSupport, forKey: "support")
            do {
                try context.save()
            } catch _ {
            }
            
            //println(newSchedule)
           // println("Object Saved")
            self.dismiss(animated: true, completion: nil)

            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 300,height: 200)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
