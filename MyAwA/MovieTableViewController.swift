//
//  MovieTableViewController.swift
//  MyAwA
//
//  Created by Athletes with Autism on 8/7/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//
import AVKit
import AVFoundation
import CoreData
import MediaPlayer


class MovieTableViewController: UITableViewController {
    @objc var mediaPlayer: AVPlayerViewController = AVPlayerViewController()
    @objc var myURL:NSURL = NSURL()
    @objc var myString:String = String()

    override func viewDidLoad() {
        super.viewDidLoad()

          print("The Movie Titles are: \(mainGlobalArray.movieTitles)")
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
    let keyArray = Array(mainGlobalArray.movieDictonary.keys)
        print("The number of sections in the movie table view is \(keyArray.count)")
        return keyArray.count   }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let keyArray = Array(mainGlobalArray.movieDictonary.keys)
        let myDict = mainGlobalArray.movieDictonary
        let theKey = keyArray[section]
        //println("theKey: \(theKey)")
        var arrayCount = Int()
        for keys in mainGlobalArray.movieDictonary.keys{
            if keys == theKey{
                let newArray: Array = myDict[theKey]!
                //println("The new array \(newArray)")
                arrayCount = newArray.count
               print("newArray count \(arrayCount)")
                
            }
        }
        return arrayCount
    }
    
        
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
       /*var prefix = ""
        if section == 0{
            prefix = "FMS"
        }
        if section == 1{
            prefix = "FAS"
        }
        if section == 2{
            prefix = "FMSC"
        }
        var sectionCount = 0
        for section in mainGlobalArray.movieTitles {
            if section.hasPrefix(prefix) {
                ++sectionCount
            }
        }
        println("The count of the \(prefix) section # \(section) = \(sectionCount)")*/
        
        //return mainGlobalArray.movieTitles.count
        
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableCell", for: indexPath) 
        let keyArray = Array(mainGlobalArray.movieDictonary.keys)
        let myDict = mainGlobalArray.movieDictonary
        let theKey = keyArray[(indexPath as NSIndexPath).section]
        //println("theKey: \(theKey)")
        //var arrayCount = Int()
        for keys in mainGlobalArray.movieDictonary.keys{
            if keys == theKey{
                var newArray: Array = myDict[theKey]!
                for _ in newArray{
                    let labelString: String = newArray[(indexPath as NSIndexPath).row]
                   //let finalString = labelString.stringByDeletingPathExtension
                    let finalString = NSURL(fileURLWithPath: labelString).deletingPathExtension
                    let finalStringString = finalString?.absoluteString
                    let index = finalStringString!.index(finalStringString!.startIndex, offsetBy: 13)
                    let theRealFinalString = String(finalStringString![index...])
                   
                    //let theRealFinalString = finalStringString!.substring(from: finalStringString!.characters.index(finalStringString!.startIndex, offsetBy: 13))
                    
                    //print("theRealFinalString - \(theRealFinalString) - finalStringString - \(finalStringString)")
                   // let theRealFinalString2 = finalString
                    let newString = theRealFinalString.replacingOccurrences(of: "*", with: " ", options: NSString.CompareOptions.literal, range: nil)
                    cell.textLabel?.text = newString
                }
                
            }
        }

        return cell
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = UIView()
        sectionView.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 60)
        sectionView.backgroundColor = UIColor.gray
        let sectionLabel = UILabel()
        sectionLabel.textAlignment = NSTextAlignment.center
        sectionLabel.frame = CGRect(x: 0, y: 0, width: sectionView.frame.size.width-10, height: 20)
        sectionLabel.center = CGPoint(x: sectionView.frame.maxX/2, y: sectionView.frame.maxY/2)
        let keyArray = Array(mainGlobalArray.movieDictonary.keys)
        let theKey = keyArray[section]
        var theLabel = String()
        if theKey == "FASF_"{
            theLabel = "Fundamental Aquatic Skills Full"
        }
        if theKey == "FMSC_"{
            theLabel = "Fundamental Motor Skills Clip"
        }
        if theKey == "FMSF_"{
            theLabel = "Fundamental Motor Skills Full"
        }
        if theKey == "SWIM_"{
            theLabel = "Swim Stroke"
        }
        if theKey == "TENS_"{
            theLabel = "Tennis Skills"
        }
        sectionLabel.text = theLabel
        sectionLabel.textColor = UIColor.white
        sectionView.addSubview(sectionLabel)
        return sectionView
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let keyArray = Array(mainGlobalArray.movieDictonary.keys)
        let theKey = keyArray[section]
        var theLabel = String()
        if theKey == "FASF_"{
            theLabel = "Fundamental Aquatic Skills Full"
        }
        if theKey == "FMSC_"{
            theLabel = "Fundamental Motor Skills Clip"
        }
        if theKey == "FMSF_"{
            theLabel = "Fundamental Motor Skills Full"
        }
        if theKey == "SWIM_"{
            theLabel = "Swim Stroke"
        }
        if theKey == "TENS_"{
            theLabel = "Tennis Skills"
        }
        return theLabel

    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // println("my storyboard: \(self.storyboard)")
        //let cell = tableView.dequeueReusableCellWithIdentifier("movieTableCell", forIndexPath: indexPath)
        let keyArray = Array(mainGlobalArray.movieDictonary.keys)
        let myDict = mainGlobalArray.movieDictonary
        let theKey = keyArray[(indexPath as NSIndexPath).section]
        //println("theKey: \(theKey)")

                var newArray: Array = myDict[theKey]!
        
                    let labelString: String = newArray[(indexPath as NSIndexPath).row]
                    
        print("button pressed: \(labelString)")
       let mainBundlePath = Bundle.main.bundlePath
       // print("mainBundlePath = \(mainBundlePath)")
        let fullPath2 = URL(fileURLWithPath: mainBundlePath).appendingPathComponent(labelString)
       
        //print("Full Path - \(fullPath2)")
        //let url = labelString
       // myURL = url as NSURL
        myString = fullPath2.path
       print("The string in didselect: \(myString)")
        self.performSegue(withIdentifier: "playMovie", sender: self)
        }
        //var mediaPlayer = MPMoviePlayerController(contentURL: url)
        
        /*mediaPlayer.view.frame = CGRect(x: 20, y: 100, width: 2, height: 2)
        mediaPlayer.contentURL = url
        mediaPlayer.movieSourceType = MPMovieSourceType.File
        mediaPlayer.contentURL = NSURL.fileURLWithPath(fullPath2)
        mediaPlayer.fullscreen = true
        //mediaPlayer.view.frame = view.bounds
        self.view.addSubview(mediaPlayer.view)
        mediaPlayer.setFullscreen(true, animated: true)
        mediaPlayer.prepareToPlay()
        mediaPlayer.play()
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(
            self,
            selector: "movieDidExitFullscreen:",
            name:MPMoviePlayerDidExitFullscreenNotification,
            object: nil
        )
    
        /*let mainQueue = NSOperationQueue.mainQueue()
        
        var observer = notificationCenter.addObserverForName(MPMoviePlayerPlaybackDidFinishNotification, object: MPMoviePlayerPlaybackDidFinishReasonUserInfoKey, queue: mainQueue) { _ in
            self.mediaPlayer.fullscreen = false
            println("Movie Player Finished")
        }*/
        
       /*notificationCenter.addObserver(
            self,
            selector: "didFinishPlaying",
            name:MPMoviePlayerPlaybackDidFinishNotification,
            object: nil)
            println("Sending to didFinishPlaying")*/
        }

    
        func movieDidExitFullscreen(sender : AnyObject!) {
            println("Did Exit Fullscreen")
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        func didFinishPlaying (sender : AnyObject?){
         println("Movie Finished Playing.")
        }*/
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        //println("Segue Identifier: \(segue.identifier)")
        
        if segue.identifier == "playMovie"{
            let vc = segue.destination as! MoviePlayerViewController
            vc.urlString = myString
            

            
            //println("urlString in Table View: \(vc.urlString)")
        }
        else{
           // println("Not the right segue")
        }
    }
}
