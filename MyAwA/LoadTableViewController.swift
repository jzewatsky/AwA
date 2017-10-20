//
//  LoadTableViewController.swift
//  MyAwA
//
//  Created by Athletes with Autism on 8/1/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//

import CoreData
import UIKit

var cellCount = NSInteger()
var resultsArray = NSArray()
//var mainView = ViewController()

protocol LoadTableViewControllerDelegate
{
    func reloadCollectionView(_ controller:LoadTableViewController)
}
class LoadTableViewController: UITableViewController {

    var delegate:LoadTableViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        //let myRequest = NSFetchRequest(entityName: "SavedArray")
        //let myRequest: NSFetchRequest<NSFetchRequestResult> = SavedArray.fetchRequest()
        
        let myRequest: NSFetchRequest<SavedArray> = SavedArray.fetchRequest()

        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
       // let sortDescriptors = [sortDescriptor]
        myRequest.sortDescriptors = [sortDescriptor]
        myRequest.returnsObjectsAsFaults = false
        
        let results: NSArray = try! context.fetch(myRequest) as NSArray
        
        resultsArray = results
    
        tableView.reloadData()

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
    
            let myRequest: NSFetchRequest<NSFetchRequestResult> = SavedArray.fetchRequest()
   

        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        //let sortDescriptors = [sortDescriptor]
        myRequest.sortDescriptors = [sortDescriptor]
        myRequest.returnsObjectsAsFaults = false
        
        let results:NSArray = try! context.fetch(myRequest) as NSArray
      // NSLog("The cell count is: %i",resultsArray.count)
        return results.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) 
        
        
        
        //var res = resultsArray[indexPath.row] as! NSManagedObject
         //NSLog("The index is %i and the name is %@", indexPath.row, resultsArray[indexPath.row].valueForKey("name") as String)
        if ((resultsArray[(indexPath as NSIndexPath).row] as AnyObject).value(forKey: "name") != nil){
        tableCell.textLabel?.text = (resultsArray[(indexPath as NSIndexPath).row] as AnyObject).value(forKey: "name") as? String
        }
       // NSLog("The cell label is: %@", tableCell.textLabel.text)
        
        // Configure the cell...

        return tableCell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //var res = Array<NSString>()
        
        images2 = (resultsArray[(indexPath as NSIndexPath).row] as AnyObject).value(forKey: "array") as! Array
        //res = (resultsArray[(indexPath as NSIndexPath).row] as AnyObject).value(forKey: "array") as! Array
        scheduleTimes = (resultsArray[(indexPath as NSIndexPath).row] as AnyObject).value(forKey: "times") as! Array
        scheduleSupport = (resultsArray[(indexPath as NSIndexPath).row] as AnyObject).value(forKey: "support") as! Array
        mainGlobalArray.tempImages2 = images2
        //images2 = res
        print(images2)
        OptionsViewController().addCollectionView?.reloadData()
       // NSLog("Trying to send notification")
       
        NotificationCenter.default.post(name: Notification.Name(rawValue: "load"), object: nil)
        self.dismiss(animated: true, completion:nil)
        
    }

    /*
    //Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
       // let myRequest = NSFetchRequest(entityName: "SavedArray")
        let myRequest: NSFetchRequest<NSFetchRequestResult> = SavedArray.fetchRequest()

        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
       // let sortDescriptors = [sortDescriptor]
        myRequest.sortDescriptors = [sortDescriptor]
        myRequest.returnsObjectsAsFaults = false
        
        let results:NSArray = try! context.fetch(myRequest) as NSArray
        if editingStyle == .delete {
           let managedObject:NSManagedObject = results[(indexPath as NSIndexPath).row] as! NSManagedObject
            context.delete(managedObject)
            do {
                try context.save()
            } catch _ {
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
           // println(context)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
