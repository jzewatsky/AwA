//
//  StoryTableView.swift
//  MyAwA
//
//  Created by Athletes with Autism on 11/9/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//

import CoreData
import UIKit

//var mainView = ViewController()
protocol StoryTableViewDelegate
{

}
class StoryTableView: UITableViewController {
    
    var delegate:StoryTableViewDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
            let myRequest: NSFetchRequest<NSFetchRequestResult> = StoryArray.fetchRequest()


        let sortDescriptor = NSSortDescriptor(key: "storyName", ascending: true)
        //let sortDescriptors = [sortDescriptor]
        myRequest.sortDescriptors = [sortDescriptor]
        myRequest.returnsObjectsAsFaults = false
        
        let results:NSArray = try! context.fetch(myRequest) as NSArray
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
        let appDel:AppDelegate = (UIApplication.shared.delegate)as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        //let myRequest = NSFetchRequest(entityName: "StoryArray")
        let myRequest: NSFetchRequest<NSFetchRequestResult> = StoryArray.fetchRequest()

        let sortDescriptor = NSSortDescriptor(key: "storyName", ascending: true)
        //let sortDescriptors = [sortDescriptor]
        myRequest.sortDescriptors = [sortDescriptor]
        myRequest.returnsObjectsAsFaults = false
        
        let results:NSArray = try! context.fetch(myRequest) as NSArray
        // NSLog("The cell count is: %i",resultsArray.count)
        return results.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let storyTableCell = tableView.dequeueReusableCell(withIdentifier: "storyTableCell", for: indexPath) 
        
        let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        //let myRequest = NSFetchRequest(entityName: "StoryArray")
        let myRequest: NSFetchRequest<NSFetchRequestResult> = StoryArray.fetchRequest()

        let sortDescriptor = NSSortDescriptor(key: "storyName", ascending: true)
        //let sortDescriptors = [sortDescriptor]
        myRequest.sortDescriptors = [sortDescriptor]
        myRequest.returnsObjectsAsFaults = false
        
        let results:NSArray = try! context.fetch(myRequest) as NSArray
        //var res = results[indexPath.row] as! NSManagedObject
        //NSLog("The index is %i and the name is %@", indexPath.row, resultsArray[indexPath.row].valueForKey("name") as String)
        if ((results[(indexPath as NSIndexPath).row] as AnyObject).value(forKey: "storyName") != nil){
            storyTableCell.textLabel?.text = (results[(indexPath as NSIndexPath).row] as AnyObject).value(forKey: "storyName") as? String
        }
        // NSLog("The cell label is: %@", tableCell.textLabel.text)
        
        // Configure the cell...
        
        return storyTableCell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var resText = Array<NSString>()
        var resImages = Array<NSString>()
        
        let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        //let myRequest = NSFetchRequest(entityName: "StoryArray")
        
        let myRequest: NSFetchRequest<NSFetchRequestResult> = StoryArray.fetchRequest()

        let sortDescriptor = NSSortDescriptor(key: "storyName", ascending: true)
       // let sortDescriptors = [sortDescriptor]
        myRequest.sortDescriptors = [sortDescriptor]
        myRequest.returnsObjectsAsFaults = false
        
        let results:NSArray = try! context.fetch(myRequest) as NSArray
        resText = (results[(indexPath as NSIndexPath).row] as AnyObject).value(forKey: "storyText") as! Array
        resImages = (results[(indexPath as NSIndexPath).row] as AnyObject).value(forKey: "storyImages") as! Array
        print("Text array: \(resText)")
        // NSLog("Trying to send notification")
        mainGlobalArray.storyText = resText as NSArray
        mainGlobalArray.storyImage = resImages as NSArray
        mainGlobalArray.createStory = false
        self.performSegue(withIdentifier: "socialStorySegue", sender: self)
        //NSNotificationCenter.defaultCenter().postNotificationName("DismissPopoverNotification", object: nil)
        //self.dismissViewControllerAnimated(true, completion:nil)
        
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
        //let myRequest = NSFetchRequest(entityName: "StoryArray")
        let myRequest: NSFetchRequest<NSFetchRequestResult> = StoryArray.fetchRequest()

        let sortDescriptor = NSSortDescriptor(key: "storyName", ascending: true)
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
    @IBAction func newStory(_ sender: AnyObject) {
        
        mainGlobalArray.createStory = true
        mainGlobalArray.storyImage = ["blank"]
        mainGlobalArray.storyText = [" "]
        self.performSegue(withIdentifier: "socialStorySegue", sender: self)
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
    override func prepare(for segue: (UIStoryboardSegue?), sender: Any!)
    {

        if segue?.identifier == "socialStorySegue"{
            print("socialStorySegue")
            //let StorySegue = segue.destination as! RootViewController
            
        }
            
        else
        {
            
        }
        
    }

}

