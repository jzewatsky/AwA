
//
//  ViewController.swift
//  MyAwA
//
//  Created by Athletes with Autism on 7/25/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//

import CoreData
import QuartzCore
import GLKit
import Foundation
import AVFoundation
import UIKit



protocol ViewControllerDelegate{
    func reloadTopCollectionView()
}
var deleteName = String()
var deleteIndex = Int()
var fileExists = Bool()
var sliderValue = Int()
var timer = Timer()
var deleteFromBottom = Bool(false)
var increment = Float()
var images2 = Array<NSString>()
{
didSet{
    OptionsViewController().addCollectionView?.reloadData()
    ViewController().topCollectionView?.reloadData()
}
}
var orientation = String()
var imageCount = Int()
var mainArray = Array<NSArray>()
var topOfScheduleArray = Array<NSString>()
var bottomOfScheduleArray = Array<NSString>()
var images = Array<NSString>()
var schedSection = Array<NSString>()
var fmsSection = Array<NSString>()
var miscSection = Array<NSString>()
var swimSection = Array<NSString>()
var customSection = Array<NSString>()
var resetImages = Array<NSString>()
var tempMovies = Array<NSString>()
var tempMovieNames = Array<NSString>()
var timerPicture = String()
var senderValue = Int()
var Sminutes = Int()
var SminAsSeconds = Int()
var Sseconds = Int()
var SstrMinutes = String()
var SstrSeconds = String()
var minutes = Int()
var minAsSeconds = Int()
var seconds = Int()
var strMinutes = String()
var strSeconds = String()
var scheduleCount = Int(0)
var gameState = Bool()
var timerImageString = String()
var timerTime = Int()
var nexttimerImageString = String()
var optionsViewShown = Bool(false)
var startingCollectionViewRec = CGRect()
var blankView = UIView()
var containerView = UIView()
var testView = UIView()
var blankIsShowing = Bool(true)
var audioPlayer: AVAudioPlayer?
var storyNameArray = Array<NSString>()
var storyTextArray = Array<NSArray>()
var storyImagesArray = Array<NSArray>()
var scheduleTimes = Array<Int>()
var scheduleSupport = Array<NSString>()
var timerBool = Bool(true)
var thestroke = UIColor()
var timerCF = Int()
var settingstimerCF = Int()
var settingsSupportString = NSString()
var myTimer = Timer()
var theGlobalTimer = Timer()
var theBreakTimer = Timer()
var resetTimer = Timer()
let progressLine = CAShapeLayer()
let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
var countDownLabel = UILabel()
var labelLayer = CALayer()
var startPoint = CGPoint()
var settingsImageString = String()
var selectedIndex = Int()
var settingsScheduleTimesReturn = Int()
var settingsScheduleSupportReturn = NSString()
var collectionPoint = CGPoint()
var imageString = String()
var match = Bool()
var storySearch = NSString()
var movieString = NSString()
var setTag = Int()
var theProgress = Float()
var time = Int()
var sizeForCellinSection0 = CGSize()
var tempSupport = String()
var tempTime = Int()
 var setProgress = Float()
var breakTime = Float()
var breaktimerinc = Float()

//["learn_nobulb.jpg","Suprise_text_white.jpg","cooldown.jpg","swimming_text_white.jpg","game_white.jpg","learn_nobulb.jpg","Suprise_text_white.jpg","cooldown.jpg","swimming_text_white.jpg","game_white.jpg"]
var cellLocations = Array<NSValue>()
var cellNames = Array<NSString>()

class ViewController: UIViewController, UICollectionViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate,
LoadTableViewControllerDelegate {
  @IBOutlet weak var progress: UIProgressView!
    @objc let moveImageView = UIImageView()
    @objc var beganOnMove = NSInteger()
    @objc var indexPathFrame = CGRect()
    @objc var hitRec = CGRect()
    @objc var name = NSString()
    @objc var hitTheTarget = Bool()
    @objc var tempName = NSString()
    @objc var pointAtTouch = CGPoint()
    @objc var targetRec = CGRect()
    @objc var locationInView = CGRect()
    @objc var delegate:LoadTableViewController?
    @objc var timerImage = UIImage()
    @objc var timeForTimer = Int()

    @IBOutlet weak var breakProgressView: UIProgressView!
    @IBOutlet weak var globalTimerLabel: UILabel!
    @IBOutlet var newCollectionView: UICollectionView?
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var timerImageView: UIImageView!
    @IBOutlet weak var topCVView: UIView!
    @IBOutlet weak var OptionsView: UIView!
    @IBOutlet weak var OptionsButton: UIButton!
    @IBOutlet weak var timerView: UIView!
    @IBOutlet var editButton: UIButton?
    @IBOutlet weak var panGesture: UIPanGestureRecognizer?
    @IBOutlet var bottomCollectionView: UICollectionView?
    @IBOutlet var revealerButton: UIButton?

    @IBOutlet weak var breakViewBlur: UIVisualEffectView!
  
    //@IBOutlet weak var button5: UIButton!
    //@IBOutlet weak var button1: UIButton!
    //@IBOutlet weak var button10: UIButton!
    @IBOutlet weak var breakButton: UIButton!
    @IBOutlet weak var storyIndicator: UIView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var collectionViewBaseView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var timerStepper: UIStepper!

    @IBOutlet weak var startTimer: UIButton!
    @IBOutlet var LongPressGesture: UILongPressGestureRecognizer!
    
    @IBOutlet weak var lowerCollectionViewButton: UIButton!
 
    @IBOutlet var targetImage: UIImageView?
    @IBOutlet var movingCell: HomeCollectionViewCell?
    
    @IBAction func removefromArray(_ sender: AnyObject) {
        images2.removeAll()
       
        topCollectionView!.reloadData()
    }
    @IBOutlet weak var theGameSwitch: UISwitch!

 //   @IBOutlet weak var TimerView: UIView!

    
    @IBOutlet weak var stepperOutlet: UIStepper!
    
    @IBAction func SchedStepperChanged(_ sender: UIStepper) {
        let stepperValue = Int(sender.value)
        //NSLog("The stepper's tag is \(sender.tag) and it's value is \(stepperValue)")
        scheduleTimes[sender.tag] = stepperValue
        topCollectionView!.reloadData()
        

    }
    

    @IBAction func timerStart(_ sender: AnyObject) {
        let backgroundRingLayer = CAShapeLayer()
        timerImageView.layer.addSublayer(backgroundRingLayer)
        backgroundRingLayer.lineWidth =  timerImageView.bounds.width/2
        //let rect = CGRectInset(timerImageView.bounds, backgroundRingLayer.lineWidth / 2, backgroundRingLayer.lineWidth / 2)
        let path: UIBezierPath = UIBezierPath(arcCenter: CGPoint(x: timerImageView.bounds.width / 2, y: timerImageView.bounds.height / 2), radius: timerImageView.bounds.width / 4, startAngle: 0, endAngle: 0.3, clockwise: true)
       path.move(to: CGPoint(x: timerImageView.bounds.width, y: 0))
        //path.applyTransform(CGAffineTransformMakeRotation(1))
        backgroundRingLayer.path = path.cgPath
        backgroundRingLayer.fillColor = nil
        
        //backgroundRingLayer.anchorPoint = timerImageView.center


        backgroundRingLayer.strokeColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5).cgColor
        //backgroundRingLayer.contentsGravity = kCAGravityResize
     
        
        //backgroundRingLayer.frame = timerImageView.bounds
        //backgroundRingLayer.strokeStart = 0.0
        //backgroundRingLayer.strokeEnd = 0.7    
    }
    
    
    @IBAction func removefromArrayFour(_ sender: AnyObject) {
        images2.remove(at: 2)
        topCollectionView!.reloadData()
    }
    
    @IBOutlet var topCollectionView: UICollectionView?
    
    @IBAction func scheduleSliderChanged(_ sender: UISlider) {
        
        let sliderValue = Int(sender.value)
       //NSLog("The slider's tag is \(sender.tag) and it's value is \(sliderValue)")
        scheduleTimes[sender.tag] = sliderValue
        topCollectionView!.reloadData()
        
    }
    

    class sharedData: NSObject{
        @objc var storyText = NSArray()
        @objc var storyImage = NSArray()
    }
    
    @objc func reloadCollectionView(_ controller: LoadTableViewController) {
       // //NSLog("trying to reload")
        topCollectionView!.reloadData()
    }
    override func viewWillLayoutSubviews() {
        

        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
       // let paths2 = NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true)
        //let mainBundlePath = NSBundle.mainBundle().resourcePath!
        //let documentDirectory2 = paths2[0]
        // ////println("The application directory is \(paths2).")
        //let manager2 = NSFileManager.defaultManager()
        
       // let filesArray2 = try? manager2.contentsOfDirectoryAtPath(mainBundlePath)
        getImages(self)
       // breakViewBlur.center = self.view.center
     //   breakViewBlur.frame = self.view.frame
        

        topCollectionView!.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        topCollectionView!.reloadData()
        /*let progresScale = self.view.frame.height*0.02
        progress.transform = CGAffineTransformScale(progress.transform, 1, progresScale)*/
        
       // breakProgressView.transform = CGAffineTransformScale(progress.transform, 1.75, 1)
  
        //ShowOptionsView()
        //var shooter = UIImageView()
        moveImageView.isHidden = true
        //shooter.frame = CGRectMake(765, 450, 149, 300)
        //shooter.image = UIImage(named:"shooter.png")
        //self.view.insertSubview(shooter, belowSubview: OptionsView)
        

        /*collectionViewBaseView.hidden = true
        
        containerView.frame = CGRectMake(12, 213, 1000, 300)
        containerView.backgroundColor = UIColor.clearColor()
        blankView.frame = CGRectMake(0, 0, 1000, 300)
        testView.frame = blankView.frame
        blankView.backgroundColor = UIColor.clearColor()
        testView.backgroundColor = UIColor.blueColor()
        self.view.addSubview(containerView)
        containerView.addSubview(blankView)
        //testView.addSubview(self.collectionViewBaseView)
        var newYa = CGFloat(self.view.frame.maxY + ((OptionsView.frame.height/2) - OptionsButton.frame.height))
        self.OptionsView.center = CGPointMake(512, newYa)
        //images2.removeAtIndex(0)
        //hitRec = CGRectMake(326,60,120,120)
        targetRec = CGRectMake(276,416,88,80)
        moveImageView.tag = 0*/
        let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        //let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        /*layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
         layout.itemSize = CGSize(width: 100, height: 100)
        layout.headerReferenceSize = CGSizeMake(30,30)

        bottomCollectionView?.collectionViewLayout = layout*/
        bottomCollectionView?.register(collectionViewHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerView")
        //let myRequest = NSFetchRequest(entityName: "SavedArray")
        let myRequest: NSFetchRequest<NSFetchRequestResult> = SavedArray.fetchRequest()

        myRequest.returnsObjectsAsFaults = false
        
        let results:NSArray = try! context.fetch(myRequest) as NSArray
        resultsArray = results
        NotificationCenter.default.addObserver(self, selector:#selector(ViewController.dismissPopover(_:)), name:NSNotification.Name(rawValue: "DismissPopoverNotification"), object: nil)
        
        //let paths2 = NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true)
       // let mainBundlePath = NSBundle.mainBundle().resourcePath!
        //let documentDirectory2 = paths2[0]
        //println("The application directory is \(paths2).")
        //let manager2 = NSFileManager.defaultManager()
        
        //let filesArray2 = try? manager2.contentsOfDirectoryAtPath(mainBundlePath)
        getImages(self)

       /* let defaultScheduleArray = ["1_inc_sched_welcome.png","2_inc_sched_warmup.png","3_inc_sched_practice.png","4_inc_sched_game.png","5_inc_sched_cooldown.png","7_inc_sched_gohome.png"]
        scheduleTimes = [300,600,1200,1200,300,0]
        for dimage in defaultScheduleArray{
            let dfullPath = mainBundlePath.stringByAppendingPathComponent(dimage) as String
            images2.append(dfullPath)
        }
        mainGlobalArray.tempImages2 = images2*/
        var testString = ""
        //var match = Bool(false)
        for movies in tempMovieNames
        {
            testString = movies.substring(to: 5)
            if mainGlobalArray.movieDictonary.count == 0{
                mainGlobalArray.movieDictonary.updateValue(Array(), forKey: testString)
            }
        for keys in mainGlobalArray.movieDictonary.keys
        {
            //print("The key is \(keys) and the testString is \(testString)")
            if keys != testString{
                //match = true
                
                mainGlobalArray.movieDictonary.updateValue(Array(), forKey: testString)
            }
            }
            }
        for keys in mainGlobalArray.movieDictonary.keys
        {
       //println("The movieDictonary contains: \(keys)")
            var tempArray = Array<String>()
            for movies in tempMovieNames{
                if movies.substring(to: 5) == keys{
                    tempArray.append(movies as String)
                }
            }
          //println("There are \(tempArray.count) items in the tempArray")
            mainGlobalArray.movieDictonary.updateValue(tempArray, forKey: keys)
            //let newArray = Array(mainGlobalArray.movieDictonary.values)
            /*for stuff in newArray{
       println("\(stuff) is in the newArray for \(keys)")
            }*/
        }
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectory = paths[0] 
        let manager = FileManager.default

        let filesArray = try? manager.contentsOfDirectory(atPath: documentDirectory)
        for theFiles in filesArray!{
            
           if URL(fileURLWithPath: theFiles).pathExtension == "png"{
            //////println("match")
            let fileName = theFiles 
            let fullPath = URL(fileURLWithPath: documentDirectory).appendingPathComponent(fileName)
            //////println(fullPath)
            let sfullPath = fullPath.absoluteString
            images.append(sfullPath as NSString)
            //print("Full Path in ViewDidLoad: \(sfullPath)")
            }
        self.view.addSubview(moveImageView)
        }
        
        //////println("The directory is \(documentDirectory) and it has \(filesArray)")
        mainGlobalArray.movies = tempMovies as NSArray
        mainGlobalArray.movieTitles = tempMovieNames as NSArray
        //////println("The Movies Array contains: \(mainGlobalArray.movies)")
    
    buildStory()
        let defaultScheduleArray = ["1_inc_sched_welcome.png","2_inc_sched_warmup.png","3_inc_sched_practice.png","4_inc_sched_game.png","5_inc_sched_cooldown.png","7_inc_sched_gohome.png"]
        scheduleTimes = [300,600,1200,1200,300,0]
        scheduleSupport = ["Welcome","Warm-up","Skill Practice","Game Time","Cool Down","Go Home"]
        for dimage in defaultScheduleArray{
         //   let dfullPath = NSURL(fileURLWithPath: mainBundlePath).URLByAppendingPathComponent(dimage)
            //images2.append(dfullPath.absoluteString)
            images2.append(dimage as NSString)
        }
        mainGlobalArray.tempImages2 = images2
    topCollectionView!.reloadData()
    }
    //override func viewDidLayoutSubviews() {
      //  HideOptionsView()
    //}

    @objc func buildStory(){
        topCollectionView!.reloadData()
        
        let appDel:AppDelegate = (UIApplication.shared.delegate)as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        let firstrun = UserDefaults.standard.bool(forKey: "firstlaunch1.0")
        print("firstlaunc1.0 = \(firstrun)")
        if(!UserDefaults.standard.bool(forKey: "firstlaunch1.0")){
            //Put any code here and it will be executed only once.


        let storyName2 = "Home"
        let storyText2  = ["My practice session is finished, and it’s time to go home.","I will say, 'goodbye' to my friends and coaches. I can give them a high five and say, 'see you next time'.","My coach will walk with me to see my family. It is time to go home."]
        let storyImage2 = ["No Time_text.png", "High five_text.png", "inc_misc_family.png"]
        let newStory2: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
        newStory2.setValue(storyName2, forKey: "storyName")
        newStory2.setValue(storyImage2, forKey: "storyImages")
        newStory2.setValue(storyText2, forKey: "storyText")
        let storyName3 = "Welcome"
        let storyText3 = ["Before I start a group, it is nice to say \"hello\" to everyone.", "I can give my friends and coaches a nice high-five and say, \"Hello________.\"","I could also say things like, \"It's nice to see you again.\"", " I could give a complement like, \"I like your shoes.\"", "It is nice to see my friends and coaches each week and say hello."]
        let storyImage3 = ["inc_misc_hello.png","inc_misc_highfive.png","inc_misc_say.png","inc_misc_compliment.png","inc_misc_hello.png"]
        let newStory3: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
        newStory3.setValue(storyName3, forKey: "storyName")
        newStory3.setValue(storyImage3, forKey: "storyImages")
        newStory3.setValue(storyText3, forKey: "storyText")
      
            let storyName4 = "Warm-up"
            let storyText4 = ["It is important to warm up my muscles before I play.","I warm up so that I don’t get hurt.","It is also important to stretch my muscles.","My coach will ask me to warm-up so I am ready to play."]
            let storyImage4 = ["2_inc_sched_warmup.png", "inc_misc_nothurt.png","inc_misc_stretch2.png","inc_fms_run.png"]
            let newStory4: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory4.setValue(storyName4, forKey: "storyName")
            newStory4.setValue(storyImage4, forKey: "storyImages")
            newStory4.setValue(storyText4, forKey: "storyText")
            
            let storyName5 = "Skill Practice"
            let storyText5 = ["When I learn and practice a skill, I will get better.", "My coach will help me learn new skills by telling and showing me how to do the skill.", "Sometimes, I may need help. My coach might help me move my body to do the skill.", "My coach will tell me important cue words to help me learn how to do the skill.", "When I am doing the skill, I will use the cue words to help me practice.", "I may not get it right all the time, but that is okay. The more I practice, the better I will be at the skill.", "I will always try my best."]
            let storyImage5 = ["inc_misc_getbetter.png","inc_misc_learn.png", "inc_misc_needhelp.png","inc_fms_kick.png","inc_misc_skillpractice.png","inc_misc_skillpractice.png","inc_misc_best.png"]
            let newStory5: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory5.setValue(storyName5, forKey: "storyName")
            newStory5.setValue(storyImage5, forKey: "storyImages")
            newStory5.setValue(storyText5, forKey: "storyText")
            
            let storyName6 = "Game Time"
            let storyText6 = ["Game time is when I use the skills I have practiced in a fun game.", "I will listen when my coach tells me how to play the game.", "I will follow directions so that the game is fun and safe.", "Sometimes, I may win. Sometimes, I may lose.", "If I win or lose, I will say, \"good game\" to my friends and coaches when we are done.", "When the game is over, I will help clean up."]
            let storyImage6 = ["inc_misc_gametime2.png","inc_misc_listen.png","inc_misc_nothurt.png","inc_misc_winorlose.png","inc_misc_highfive.png","6_inc_sched_cleanup.png"]
            let newStory6: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory6.setValue(storyName6, forKey: "storyName")
            newStory6.setValue(storyImage6, forKey: "storyImages")
            newStory6.setValue(storyText6, forKey: "storyText")
            
            let storyName7 = "Cool Down"
            let storyText7 = ["It is important to cool down my muscles after I play.", "I cool down so I don’t get hurt. ","After I play a game, my coach will ask me to cool down."]
            let storyImage7 = ["5_inc_sched_cooldown.png","inc_misc_nothurt.png","inc_misc_stretch2.png"]
            let newStory7: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory7.setValue(storyName7, forKey: "storyName")
            newStory7.setValue(storyImage7, forKey: "storyImages")
            newStory7.setValue(storyText7, forKey: "storyText")
            
            let storyName8 = "Go Home"
            let storyText8 = ["My practice session is finished, and it’s time to go home.", "I will say, \"goodbye\" to my friends and coaches. I can give them a high five and say, \"see you next time\". ","My coach will walk with me to see my family. It is time to go home."]
            let storyImage8 = ["inc_misc_notime.png","inc_misc_highfive.png","7_inc_sched_gohome.png"]
            let newStory8: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory8.setValue(storyName8, forKey: "storyName")
            newStory8.setValue(storyImage8, forKey: "storyImages")
            newStory8.setValue(storyText8, forKey: "storyText")
            
            let storyName9 = "Surprise"
            let storyText9 = ["I have a schedule at AwA. Today is different because there is a surprise.", "Surprises happen at different times and that’s okay.", "My coach will tell me what to do and I will listen."]
            let storyImage9 = ["Suprise_text_white.jpg","Suprise_text_white.jpg ","inc_misc_listen.png"]
            let newStory9: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory9.setValue(storyName9, forKey: "storyName")
            newStory9.setValue(storyImage9, forKey: "storyImages")
            newStory9.setValue(storyText9, forKey: "storyText")
            
            let storyName10 = "How to be a Good Winner"
            let storyText10 = ["If I win, I can say, \"Yes!\" one time to my coach and teammates.", "I will say, \"Good game\" to the other coaches and teammates.", "I will give high fives and smile.", "I will not brag about being the winner."]
            let storyImage10 = ["inc_misc_winorlose.png","inc_misc_compliment.png",
                "inc_misc_stretch.png","inc_misc_learnnobulb.png"]
            let newStory10: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory10.setValue(storyName10, forKey: "storyName")
            newStory10.setValue(storyImage10, forKey: "storyImages")
            newStory10.setValue(storyText10, forKey: "storyText")
            
            let storyName11 = "Swim Practice"
            let storyText11 = ["When I learn and practice a skill I will get better.",
                               "My coach will help me learn new skills by telling and showing me how to do the skill.",
                               "My coach will tell me important cue words to help me learn how to do the skill.",
                               "When I am doing the skill I will use the cue words to help me practice.",
                               "I may not get it right all the time, but that is okay. The more I practice the better I will be at the skill.",
                               "I will always try my best."]
            let storyImage11 = ["inc_misc_getbetter.png",
                                "inc_swim_treadwater.jpg",
                                "inc_misc_needhelp.png",
                                "inc_swim_freestyle.png",
                                "inc_swim_aquaticskillpractice.jpg",
                                "inc_misc_best.png"]
            let newStory11: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory11.setValue(storyName11, forKey: "storyName")
            newStory11.setValue(storyImage11, forKey: "storyImages")
            newStory11.setValue(storyText11, forKey: "storyText")
            
            let storyName12 = "Game Time in the Pool"
            let storyText12 = ["Game time is when I use the skills I have practiced in a fun game.", "I will listen when my coach tells me how to play the game.", "I will follow directions so that the game is fun and safe.", "When the game is over, I will help clean up."]
            let storyImage12 = ["inc_swim_aquaticskillpractice.jpg",
                "inc_misc_listen.png","inc_misc_nothurt.png",
                "inc_swim_object.jpg"]
            let newStory12: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory12.setValue(storyName12, forKey: "storyName")
            newStory12.setValue(storyImage12, forKey: "storyImages")
            newStory12.setValue(storyText12, forKey: "storyText")
            
            let storyName13 = "How to be a Good Friend"
            let storyText13 = ["When I play with a friend, sometimes it is hard to wait my turn or share my equipment.", "Good friends wait their turn and share their equipment.", "I will be a good friend, wait my turn and share my equipment."]
            let storyImage13 = ["3_inc_sched_practice.png","inc_misc_gametime2.png","inc_misc_learnnobulb.png"]
            let newStory13: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory13.setValue(storyName13, forKey: "storyName")
            newStory13.setValue(storyImage13, forKey: "storyImages")
            newStory13.setValue(storyText13, forKey: "storyText")
            
            let storyName14 = "Swim Surprise"
            let storyText14 = ["I have a schedule at AwA. Today is different because there is a surprise.", "Surprises happen at different times and that’s okay.", "My coach will tell me what to do and I will listen."]
            let storyImage14 = ["Suprise_text_white.jpg","inc_swim_swimschedule.jpg","inc_misc_listen.png"]
            let newStory14: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory14.setValue(storyName14, forKey: "storyName")
            newStory14.setValue(storyImage14, forKey: "storyImages")
            newStory14.setValue(storyText14, forKey: "storyText")
            
        do {
            try context.save()
        } catch _ {
        }
        //print("Is a first launch...added stories")
        UserDefaults.standard.set(true, forKey: "firstlaunch1.0")
        UserDefaults.standard.set(true, forKey: "fixedStories")
        UserDefaults.standard.synchronize();
        }
        else{
    let buildNumber: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        print("Build # \(buildNumber)")
        
            
if !UserDefaults.standard.bool(forKey: "fixedStories")
{
            print("Build 5.0 first run, what do you want?")
    //let fetchRequest = NSFetchRequest(entityName: "StoryArray")
    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = StoryArray.fetchRequest()

    let sortDescriptor = NSSortDescriptor(key: "storyName", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    let surprise = "Surprise"
    let winner = "How to be a Good Winner"
    let winner2 = "How to be a good winner"
    let swim = "Swim Practice"
    let predicateA = NSPredicate(format: "storyName = %@", surprise)
    let predicateB = NSPredicate(format: "storyName = %@", winner)
    let predicateC = NSPredicate(format: "storyName = %@", swim)
    let predicateD = NSPredicate(format: "storyName = %@", winner2)
    let predicate = NSCompoundPredicate.init(orPredicateWithSubpredicates:[predicateA, predicateB, predicateC, predicateD])
    fetchRequest.predicate = predicate
    do {
        let result = try context.fetch(fetchRequest)
        print("fetchRequst successful")
        for story in result{
            
            //print("value for story is \(name) and has the text \(text)")
            context.delete(story as! NSManagedObject)
        }
        var i = 0
        while result.count > i {
            context.delete(result[0] as! NSManagedObject)
            i += 1
        }
        do {
            try context.save()
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        
    } catch {
        let fetchError = error as NSError
        print(fetchError)
    }
           let storyName9 = "Surprise"
            let storyText9 = ["I have a schedule at AwA. Today is different because there is a surprise.", "Surprises happen at different times and that’s okay.", "My coach will tell me what to do and I will listen."]
            let storyImage9 = ["Suprise_text_white.jpg","Suprise_text_white.jpg ","inc_misc_listen.png"]
            let newStory9: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory9.setValue(storyName9, forKey: "storyName")
            newStory9.setValue(storyImage9, forKey: "storyImages")
            newStory9.setValue(storyText9, forKey: "storyText")
            
            let storyName10 = "How to be a Good Winner"
            let storyText10 = ["If I win, I can say, \"Yes!\" one time to my coach and teammates.", "I will say, \"Good game\" to the other coaches and teammates.", "I will give high fives and smile.", "I will not brag about being the winner."]
            let storyImage10 = ["inc_misc_winorlose.png","inc_misc_compliment.png",
                                "inc_misc_stretch.png","inc_misc_learnnobulb.png"]
            let newStory10: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory10.setValue(storyName10, forKey: "storyName")
            newStory10.setValue(storyImage10, forKey: "storyImages")
            newStory10.setValue(storyText10, forKey: "storyText")
            
            let storyName11 = "Swim Practice"
            let storyText11 = ["When I learn and practice a skill I will get better.",
                               "My coach will help me learn new skills by telling and showing me how to do the skill.",
                               "My coach will tell me important cue words to help me learn how to do the skill.",
                               "When I am doing the skill I will use the cue words to help me practice.",
                               "I may not get it right all the time, but that is okay. The more I practice the better I will be at the skill.",
                               "I will always try my best."]
            let storyImage11 = ["inc_misc_getbetter.png",
                                "inc_swim_treadwater.jpg",
                                "inc_misc_needhelp.png",
                                "inc_swim_freestyle.png",
                                "inc_swim_aquaticskillpractice.jpg",
                                "inc_misc_best.png"]
            let newStory11: AnyObject! = NSEntityDescription.insertNewObject(forEntityName: "StoryArray", into: context)
            newStory11.setValue(storyName11, forKey: "storyName")
            newStory11.setValue(storyImage11, forKey: "storyImages")
            newStory11.setValue(storyText11, forKey: "storyText")
        UserDefaults.standard.set(true, forKey: "fixedStories")
        UserDefaults.standard.synchronize();
        }
else{
    print("Stories already fixed")
            }
        }
        
    }
    @objc func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory as NSString
    }
    @objc func getImages(_ sender: AnyObject){
        images.removeAll(keepingCapacity: true)
        tempMovieNames.removeAll(keepingCapacity: true)
        tempMovies.removeAll(keepingCapacity: true)
        //let paths2 = NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true)
        let mainBundlePath = Bundle.main.resourcePath!
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String

        //let nsDocumentDirectory = NSSearchPathDirectory.DocumentDirectory

       // let documentDirectory2 = paths2[0]
        // ////println("The application directory is \(paths2).")
        let manager2 = FileManager.default
        let filesArray2 = try? manager2.contentsOfDirectory(atPath: mainBundlePath)
        let filesArray3 = try? manager2.contentsOfDirectory(atPath: documentsPath)
        ////println("The directory is \(mainBundlePath) and it has \(filesArray2)")
        for theFiles2 in filesArray2!{
            var fileString = String()
           
            fileString = theFiles2 
            if (fileString.range(of: "inc_") != nil) {
                //////println("match")
                let fileName2 = theFiles2 
               // let fullPath2 = NSURL(fileURLWithPath: mainBundlePath).URLByAppendingPathComponent(fileName2)
                //images.append(fullPath2.absoluteString)
                images.append(fileName2 as NSString)
                //print("Full Path in filesArray2 \(fullPath2) string: \(fullPath2.absoluteString)")
            }
            
            if URL(string: theFiles2)?.pathExtension == "mp4"{
                //////println("match")
                let fileName2 = theFiles2
               // let fullPath2 = NSURL(fileURLWithPath: mainBundlePath as String).URLByAppendingPathComponent(fileName2)
                //////println(fullPath2)
                tempMovieNames.append(fileName2 as NSString)
                tempMovies.append(fileName2 as NSString)
                //tempMovies.append(fullPath2.absoluteString)
                //print("Full Path in Movies \(fullPath2) string: \(fullPath2.absoluteString)")
            }
            
        }
       for theFiles2 in filesArray3!{
            var fileString = String()
            let writePath = getDocumentsDirectory()
            fileString = theFiles2
            if (fileString.range(of: "inc_") != nil) {
                //////println("match")
                
                let fileName2 = theFiles2
                let fullPath2 = URL(fileURLWithPath: writePath as String).appendingPathComponent(fileName2)
                //images.append(fullPath2.absoluteString)
                
                images.append(fullPath2.path as NSString)
                //print("Full Path in filesArray2 \(fullPath2) string: \(fullPath2.absoluteString)")
            }
            
            if URL(string: theFiles2)?.pathExtension == "mp4"{
                //////println("match")
                let fileName2 = theFiles2
                let fullPath2 = URL(fileURLWithPath: writePath as String).appendingPathComponent(fileName2)
                //////println(fullPath2)
                tempMovieNames.append(fullPath2.path as NSString)
                tempMovies.append(fullPath2.path as NSString)
                //tempMovies.append(fullPath2.absoluteString)
                //print("Full Path in Movies \(fullPath2) string: \(fullPath2.absoluteString)")
            }
            
        }
    /*    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = paths[0] 
        let manager = NSFileManager.defaultManager()
        
        let filesArray = try? manager.contentsOfDirectoryAtPath(documentDirectory)
        for theFiles in filesArray!{
            
            if NSURL(fileURLWithPath: theFiles).pathExtension == "png"{
                //////println("match")
                let fileName = theFiles 
                let fullPath = NSURL(fileURLWithPath: documentDirectory.path!).URLByAppendingPathComponent(fileName)
                //////println(fullPath)
                //images.append(fullPath.absoluteString)
                images.append(fileName)
            }
        }*/
        //print("images = \(images)")
        buildArrays()

    }
    @objc func buildArrays(){
        mainArray.removeAll(keepingCapacity: true)
        schedSection.removeAll(keepingCapacity: true)
        swimSection.removeAll(keepingCapacity: true)
        fmsSection.removeAll(keepingCapacity: true)
        miscSection.removeAll(keepingCapacity: true)
        customSection.removeAll(keepingCapacity: true)
        for imagStr in images{
            let sortString = imagStr as String
            if (sortString.range(of: "_sched_") != nil) {
                schedSection.append(sortString as NSString)
            }
            if (sortString.range(of: "_swim_") != nil) {
                swimSection.append(sortString as NSString)
            }
            if (sortString.range(of: "_fms_") != nil) {
                fmsSection.append(sortString as NSString)
            }
            if (sortString.range(of: "_misc_") != nil) {
                miscSection.append(sortString as NSString)
            }
            if (sortString.range(of: "_custom_") != nil) {
                customSection.append(sortString as NSString)
                //print("customSection string ---- \(sortString)")
            }
           
            
        }
        //print("Built Section Arrays Sched: \(schedSection.count), Swim:\(swimSection.count), FMS:\(fmsSection.count), Misc: \(miscSection.count), Custom: \(customSection.count)")
        mainArray.append(schedSection as NSArray)
        mainArray.append(swimSection as NSArray)
        mainArray.append(fmsSection as NSArray)
        mainArray.append(miscSection as NSArray)
        mainArray.append(customSection as NSArray)
        //let z = Int(1)
        ////println("mainArray contains \(mainArray.count) arrays.  The second array contains \(mainArray[z].count)")
        
        
    }
    @objc func dismissPopover(_: Notification) {
        ////NSLog("Notification Received")
        images2 = mainGlobalArray.tempImages2
        topCollectionView!.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func clearSchedule(_ sender: AnyObject) {
        images2.removeAll(keepingCapacity: true)
        scheduleTimes.removeAll(keepingCapacity: true)
        scheduleSupport.removeAll(keepingCapacity: true)
        mainGlobalArray.tempImages2 = images2
        topCollectionView!.reloadData()
        
    }
    @objc func numberOfSectionsInCollectionView(_ collectionView: UICollectionView) -> Int {
        var x = Int()
        if collectionView.tag == 1{
            x = 5
        }
        if collectionView.tag == 2{
            if images2.count > 4{
                x = 2
            }
            else
            {
             x = 1
            }
        }
        return x
        
    }
    

    @objc func collectionView(_ collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int
    {
        
        if collectionView.tag == 1{
            imageCount = mainArray[section].count
        //imageCount = images.count
           // //NSLog("Collection one = %i", images.count)
        }
        if collectionView.tag == 2{
            if section == 0
            {
                if images2.count > 4
                {
                imageCount = 4
                }
                else
                {
                    imageCount = images2.count
                }
            }
            if section == 1 && images2.count > 4
            {
                imageCount = images2.count - 4
            }
            
           // //NSLog("Collection two = %i", images2.count)
        }
        
        return imageCount
        
    }

    
    @objc func collectionView(_ collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: IndexPath!) -> HomeCollectionViewCell!
    {
        
        
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
            ////println("The section is \(indexPath.section) at row \(indexPath.row) and it contains \(mainArray[indexPath.section][indexPath.row])")
            let imageString: String = mainArray[indexPath.section][indexPath.row] as! String
            ////println("imageString = \(imageString)")

            let theImage = UIImage(named:imageString)
            print("theImage from 'cellforitematindexpath' = \(theImage)")
            cell.imageView!.image = theImage! as UIImage
            return cell
        }
        if collectionView.tag==2{
            if indexPath.row == 0 && indexPath.section == 0{
                cellLocations.removeAll(keepingCapacity: true)
                cellNames.removeAll(keepingCapacity: true)
               // //NSLog("Clear the array")
            }
            
            
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! HomeCollectionViewCell
            if indexPath.section == 0
                
            {
                
                cell.imageView2!.image = UIImage(named:images2[indexPath.row] as String)
                cell.imageView2?.isHidden = false
                //var testImage = images2[indexPath.row] as String
                
                
                
                  //cell.storyIcon.hidden = true
                //cell.storyIcon.hidden = false
                ////println("cell \(indexPath.row) has \(scheduleSupport[indexPath.row]) story and \(scheduleTimes[indexPath.row])")
                    
                    if scheduleSupport[indexPath.row] == "None" || scheduleSupport[indexPath.row] == ""
                    {
                    cell.storyIcon.isHidden = true
                    }
                    else
                    {
                     cell.storyIcon.isHidden = false
                    }
                
                    if scheduleTimes[indexPath.row] > 0
                    {
                    cell.scheduleLabel.isHidden = false
                        let timerInt = scheduleTimes[indexPath.row]
                        
                        // ////println("The stepper is at \(stepper.value)")
                        let myMinutes = timerInt / 60
                        let myMinAsSeconds = myMinutes * 60
                        let mySeconds = timerInt - myMinAsSeconds
                        // ////println("\(minutes):\(seconds)")
                        let myStrMinutes = myMinutes > 9 ? String(myMinutes): "0" + String(myMinutes)
                        let myStrSeconds = mySeconds > 9 ? String(mySeconds): "0" + String(mySeconds)
                        cell.scheduleLabel.text = "\(myStrMinutes):\(myStrSeconds)"
                    }
                    else
                    {
                    cell.scheduleLabel.isHidden = true
                    }
            }
            if indexPath.section == 1
            {
                //print("***************************************************************************************************************************************************************************The cell in imageView2 has an image named \(images2[indexPath.row+4])")
                cell.imageView2!.image = UIImage(named:images2[indexPath.row+4] as String)
                cell.storyIcon.isHidden = true
             cell.scheduleLabel.isHidden = true
                        
            }
            
            
          /*
            if timerBool == true{
                progressLine.removeFromSuperlayer()
                labelLayer.removeFromSuperlayer()
                cell.imageView2?.alpha = 1.0
                //cell.imageView2?.layer.sublayers = nil
            }
            if timerBool == false {
                if moveImageView.hidden == true {
                
                if indexPath.row == 0{
                
                    
                    var ovalStartAngle: CGFloat = CGFloat(2 * M_PI)
                    var ovalEndAngle: CGFloat = 0.0
                   ovalStartAngle = ovalStartAngle - CGFloat(M_PI_2)
                    ovalEndAngle = ovalEndAngle - CGFloat(M_PI_2)
                    // = CGFloat(270.01 * M_PI/180)
                    // = CGFloat(270 * M_PI/180)
                    let ovalRect = cell.imageView2?.frame
                    let ovalRectW = ovalRect?.width
                    let ovalRectH = ovalRect?.height
                    
                    let position = CGPoint(x: ovalRectW! / 2.0, y: ovalRectH! / 2.0)
                
                    // create the bezier path
                    let ovalPath = UIBezierPath()
                    var rad = CGRectGetWidth(ovalRect!) / 2.1
                    let linew = CGRectGetWidth(ovalRect!) / 10
                    let halflinew = linew / 2
                    rad = rad - halflinew
                    ovalPath.addArcWithCenter(CGPointMake(CGRectGetMidX(ovalRect!)-9, CGRectGetMidY(ovalRect!)-9),
                        radius: rad,
                        startAngle: ovalStartAngle,
                        endAngle: ovalEndAngle, clockwise: false)
                    
                   
                    //progressLine.path = ovalPath.CGPath

                    progressLine.path = CGPathCreateWithRect(CGRect(x: 0, y: 0, width: ovalRectW!, height: ovalRectH!), nil)
                    
                    thestroke = UIColor.greenColor()
                    
                    progressLine.strokeColor = thestroke.colorWithAlphaComponent(0.5).CGColor
                    //progressLine.fillColor = UIColor.grayColor().colorWithAlphaComponent(0.5).CGColor
                    progressLine.fillColor = UIColor.clearColor().CGColor
                    progressLine.lineWidth = linew
                    cell.imageView2?.layer.contentsCenter
                    //progressLine.lineCap = kCALineCapRound
                    
                    // add the curve to the screen
                    labelLayer = countDownLabel.layer
                    //labelLayer.position = CGPointMake(CGRectGetMidX(ovalRect!)-40, CGRectGetMidY(ovalRect!))
                    labelLayer.frame = ovalRect!
                    countDownLabel.text = ""
                    countDownLabel.textAlignment = .Center
                    countDownLabel.textColor = UIColor.whiteColor()
                    //countDownLabel.frame = ovalRect!
                    countDownLabel.center = CGPointMake(CGRectGetMidX(ovalRect!)-9, CGRectGetMidY(ovalRect!)+68)

                    
                    cell.imageView2?.layer.addSublayer(progressLine)
                    cell.imageView2?.layer.addSublayer(labelLayer)
                    //self.view.layer.addSublayer(progressLine)
                    
                    // create a basic animation that animates the value 'strokeEnd'
                    // from 0.0 to 1.0 over 3.0 seconds
                    timerCF = scheduleTimes[indexPath.row]
                    //print("move image view hidden is \(moveImageView.hidden)")
                    
                    // //NSLog("Timer: %i",time)
                    if !myTimer.valid && timerCF > 0
                    {
                   myTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "update", userInfo: nil, repeats: true)
                       
                    }



                }
                }
                else{
                    cell.imageView2?.alpha = 1.0
                    cell.imageView2?.layer.sublayers = nil
                    
                  
                }
            }*/


            
           
            cellNames.insert(images2[indexPath.row], at: indexPath.row)
            if indexPath.row == (imageCount-1){
              // //NSLog("What's in the array?")
                //whatsInTheArray()
            }
            let theSize = CGSize(width: 200, height: 200)
            cell.imageView2?.sizeThatFits(theSize)
            cell.bringSubview(toFront: cell.imageView2!)
            ////println("imageView2 frame = \(cell.imageView2?.frame) for \(indexPath.row)")
            ////println("cell location = \(cell.frame)")
            let theCellInSelf2 = cell.imageView2?.frame
            //let mycellvalue = cell.imageView2?.convertRect(theCellInSelf!, fromView: mainView)
         
            let theCellInSelf = cell.imageView2?.convert(theCellInSelf2!, to: topCollectionView)
            
            //var `try` = cell.imageView2?.convertRect(theCellInSelf2!, fromView: topCollectionView)
            
        
            
            ////println("theCellInSelf is \(theCellInSelf) and try is \(try)")
            ////println("myCellValue is \(mycellvalue)")
            let val = (NSValue(cgRect: theCellInSelf!))
            if indexPath.section == 0
            {
            cellLocations.append(val)
            }
            
            return cell
            
        }
            
        else
        { return nil}
    }
    @objc func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        //let currentSize = collectionViewLayout.collectionViewContentSize()
        //let currentSize = topCollectionView?.collectionViewLayout.collectionViewContentSize()
        let currentSize = self.view.frame
        var picDimensionW = 0.0
        var picDimensionH = 0.0
        let collectionWidth = currentSize.width
        if collectionView.tag==1{
            picDimensionW = 100
            picDimensionH = 100 
        }
        if collectionView.tag==2{
           if (indexPath as NSIndexPath).section == 0
           {
                picDimensionH = Double(collectionWidth/4.5)
                picDimensionW = Double(collectionWidth/4.5)
                sizeForCellinSection0 = CGSize(width: CGFloat(picDimensionH), height: CGFloat(picDimensionW))
            }
            if (indexPath as NSIndexPath).section == 1
            {
                picDimensionH = 50
                picDimensionW = 50
            }
        
        }
        
        return CGSize(width: picDimensionW, height: picDimensionH)
    }

    @objc func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section:Int) -> UIEdgeInsets
    {

        var count = CGFloat()
        var inset = UIEdgeInsets()
        let frameWidth = collectionView.frame.width
        //print("laying out collection view with images2...\(images2)")
        var cellWidth = CGFloat()
        var top = CGFloat()
        if collectionView.tag==2{
            if section == 0
            {
                cellWidth = sizeForCellinSection0.width
                top = 0
                if images2.count > 4
                {
                    count = 4
                }
                else
                {
                    count = CGFloat(images2.count)
                }
            }
            
           if section == 1 && images2.count > 4
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
    @objc func whatsInTheArray(){
            /*for (index, value) in cellLocations.enumerate() {
                ////println("Item \(index): \(value) with name \(cellNames[index]) at \(cellLocations[index])")
            }*/
            
        }

    @objc func collectionView(_ collectionView: UICollectionView!, viewForSupplementaryElementOfKind kind: String!, atIndexPath indexPath: IndexPath!) -> UICollectionReusableView! {
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
            //print("Reusuable view section \(indexPath.section) and label \(labelText)")
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
        /*if collectionView.tag==2{
        //NSLog("That was two and clicked %i", indexPath.row)
        var name = images2[indexPath.row]
        var rect = collectionView.layoutAttributesForItemAtIndexPath(indexPath)
        
        //NSLog("The image is named %@ at %@ with a size of %@", name, NSStringFromCGPoint(rect.center), NSStringFromCGSize(rect.size))
        if indexPath.row == 0
        {
        
        
        //mainview.addSubview(imageview)
        }
        
        }*/
        /*if collectionView.tag==1 && deleteFromBottom == false{
          //  //NSLog("That was one and clicked %i", indexPath.row)
            name = mainArray[indexPath.section][indexPath.row] as! NSString
            ////NSLog("The image is named %@", name)
            images2.append(name)
           scheduleTimes.append(0)
            scheduleSupport.append("")
            setTag = images2.count - 1
            topCollectionView!.reloadData()
            for (index, value) in images2.enumerate() {
           //     ////println("Item \(index + 1): \(value)")
               
            }
        }*/
        
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let theCellInSelf2 = cell.frame
        let theCellInSelf = cell.convert(theCellInSelf2, to: topCollectionView)

        let val = (NSValue(cgRect: theCellInSelf))
        if (indexPath as NSIndexPath).section == 0{
        cellLocations[(indexPath as NSIndexPath).row] = val
                     //print("IndexPath = \(indexPath), cell frame = \(cell.frame), cell in self = \(theCellInSelf)")
        }
    }

    @objc func deleteSuccessful(){
        let action : UIAlertController = UIAlertController(title: "Image successfully deleted.", message: "The image you selected has been successfully deleted.", preferredStyle: UIAlertControllerStyle.alert)
        
        action.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { alertAction in
           // ////println("Yes CLICKED")
            action.dismiss(animated: true, completion: nil)
            
            }))
        self.present(action, animated: true, completion: nil)
    }
    @objc func update() {
        if timerCF > -1{
        // let intTimer = timerCF as Int
        // //NSLog("Update Time - %i seconds",intTimer)
        //print("Update Time - \(timerCF) seconds")
        let myMinutes = timerCF / 60
        let myMinAsSeconds = myMinutes * 60
        let mySeconds = timerCF - myMinAsSeconds
        // ////println("\(minutes):\(seconds)")
        let myStrMinutes = myMinutes > 9 ? String(myMinutes): "0" + String(myMinutes)
        let myStrSeconds = mySeconds > 9 ? String(mySeconds): "0" + String(mySeconds)
        countDownLabel.text = "\(myStrMinutes):\(myStrSeconds)"
        
        
        animateStrokeEnd.duration = 0.5
        animateStrokeEnd.fromValue = 0.0
        animateStrokeEnd.toValue = 1.0
        animateStrokeEnd.timeOffset = 0.5
        timerCF = timerCF - 1
        scheduleTimes[0] = timerCF
        if timerCF < 120{
            progressLine.strokeColor = UIColor.yellow.withAlphaComponent(0.5).cgColor
            
        }
        if timerCF < 60{
            progressLine.strokeColor = UIColor.red.withAlphaComponent(0.5).cgColor
            
        }
        
        // add the animation
        progressLine.add(animateStrokeEnd, forKey: "animate stroke end animation")
        

        if timerCF == -1{
            myTimer.invalidate()
            countDownLabel.text = "Done"
          
            }

        }
        
    }
    @IBAction func handlePan(_ recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.location(in: topCollectionView)
        var thecell = IndexPath()
        //var ourcell = UICollectionViewCell()

        if recognizer.state == UIGestureRecognizerState.began{
            startPoint = recognizer.location(in: self.view)
            print("The start point is: \(translation)")
            if (topCollectionView?.indexPathForItem(at: translation) != nil){
            thecell = topCollectionView!.indexPathForItem(at: translation)!
            //print("The cell in handle pan is \(thecell)")
            //ourcell = (topCollectionView?.cellForItemAtIndexPath(thecell))!
            }
        }
        
        let touchPoint = recognizer.location(in: self.view)
        //let theIndexPath = NSIndexPath(index: 0)
      //  ////println("touchPoint:\(touchPoint) translation:\(translation)")
        
        
        //let theCellat0 = topCollectionView!.cellForItemAtIndexPath(theIndexPath)
        hitRec = cellLocations[0].cgRectValue

        //var theHitRec: CGRect = CGRectStandardize(cellLocations[0].CGRectValue())
       //////println("theHitRec is at \(theHitRec.height),\(theHitRec.width)")
       // ////println("hitRec is at \(hitRec.origin), \(hitRec.height),\(hitRec.width)")
        //let cellAt0frame = theCellat0.frame
        //let locationincollectionview = recognizer.locationInView(topCollectionView)
        ////NSLog("Pan Gesture at point %@. The target frame is %@. The location in collection view is%@", NSStringFromCGPoint(touchPoint), NSStringFromCGRect(indexPathFrame), NSStringFromCGPoint(locationincollectionview))
        if recognizer.state == UIGestureRecognizerState.began && !images2.isEmpty {
            tempName = images2[0]
            tempSupport = scheduleSupport[0] as String
            tempTime = scheduleTimes[0]
           // //NSLog("Touches Began at %@ keeping image name %@", NSStringFromCGPoint(touchPoint), tempName)
            
            
        }
        //if CGRectContainsPoint(hitRec, translation) && moveImageView.tag != 8 && moveImageView.image != "" && !images2.isEmpty
        if thecell == IndexPath(row: 0, section: 0)
        {
            ////NSLog("Thats a hit!")
            images2[0] = "x"
            scheduleTimes[0] = 0
            scheduleSupport[0] = ""
            
            ////NSLog("image at index path hidden")
            topCollectionView!.reloadData()
           // let image1 = UIImage(named: tempName)
            //let image1 = UIImage(named: "soccer_ball.png")
            //let image1 = self.tempName
            moveImageView.image = UIImage(named: "\(tempName)")
            //moveImageView.frame = cellLocations[0].CGRectValue()
            let mysize = CGRect(x: startPoint.x, y: startPoint.y, width: 100, height: 100)
            moveImageView.frame = mysize
            moveImageView.center = startPoint
            moveImageView.tag = 8
            moveImageView.isHidden = false
            moveImageView.isUserInteractionEnabled = true
            
        }
        if moveImageView.tag == 8{
            moveImageView.center = touchPoint
        }
        if recognizer.state == UIGestureRecognizerState.ended && !images2.isEmpty && moveImageView.tag == 8
        {
           // //NSLog("Gesture Ended")
            
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear, animations: {
            self.moveImageView.center = startPoint
            
            }, completion: { finished in
            
            self.moveImageView.image = nil
            self.moveImageView.tag = 0
            self.moveImageView.center = startPoint
            self.moveImageView.isHidden = true
            self.moveImageView.isUserInteractionEnabled = false
           images2[0] = self.tempName
                scheduleTimes[0] = tempTime
                scheduleSupport[0] = tempSupport as NSString
            
            self.topCollectionView!.reloadData()
            })
            
        }
        if moveImageView.frame.contains(targetImage!.center) && !images2.isEmpty && moveImageView.tag == 8
        {
           NSLog("You hit the target!")
             moveImageView.tag = 0
            hitTarget()
            if images2.count == 0{
                //endOfArray()
                
            }
            
        }
        /*recognizer.view.center = CGPoint(x:recognizer.view.center.x + translation.x,
        y:recognizer.view.center.y + translation.y)
        recognizer.setTranslation(CGPointZero, inView: self.view)*/
    }
    @objc func hitTarget(){
        NSLog("hitTarget")
        hitTheTarget = true
        moveImageView.image = nil
       
        moveImageView.isHidden = true
        moveImageView.isUserInteractionEnabled = false
        images2.remove(at: 0)
        scheduleTimes.remove(at: 0)
        scheduleSupport.remove(at: 0)
        //NSLog("The are %i images in the array",images2.count)
        topCollectionView!.reloadData()
        
        //panGesture!.enabled = true
        name = ""
        //pointAtTouch = recognizer.locationInView(self.view)
        scheduleCount += 1
    }
    @objc func endOfArray(){
        if theGameSwitch.isOn{
            gameState = true
        }
        else{
            gameState = false
        }
        //NSLog("That's the end of the array after %i schedules...game switch on.",scheduleCount)
        self.performSegue(withIdentifier: "moveToGame", sender: self)
        }
        /*else{
            //println("end of array, game switch off")
            
            /*if let path = NSBundle.mainBundle().pathForResource("Applause", ofType: "mp3") {
            audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path), fileTypeHint: "mp3", error: nil)
            
            if let sound = audioPlayer {
            sound.prepareToPlay()
            sound.play()
            }
            }*/
        }
    }*/
       @objc func whatthewhat(){
        //print("What the what?")
        let newY = CGFloat(self.view.frame.maxY - (OptionsView.frame.height/2))
        OptionsView.center = CGPoint(x: 512, y: newY)
    }
    
    @IBAction func doubleTapForTimer(_ recognizer:UITapGestureRecognizer) {
        let collectionPoint = recognizer.location(in: topCollectionView)
        let thecell = topCollectionView!.indexPathForItem(at: collectionPoint)
        if thecell != nil
        {
        if (thecell! as NSIndexPath).section == 0
        {
        //print("index of cell: \(thecell!.row)")
        let i = (thecell! as NSIndexPath).row
        let j = i + 1
        
       // //NSLog("That's a Double Tap on the cell at index %i and it's name is %@", i, cellNames[i])
            timerImageString = images2[i] as String
            timerTime = scheduleTimes[i]
            
            if j < images2.count{
                nexttimerImageString = images2[j] as String
                
            }
            self.performSegue(withIdentifier: "timerView", sender: self)
        }
        }
    }

    @IBAction func tripleTapForStory(_ recognizer:UITapGestureRecognizer) {
        
        let collectionPoint = recognizer.location(in: topCollectionView)
        let thecell = topCollectionView!.indexPathForItem(at: collectionPoint)
        if thecell != nil
        {
        if (thecell! as NSIndexPath).section == 0
    {
        //print("index of cell: \(thecell!.row)")

                storySearch = scheduleSupport[(thecell! as NSIndexPath).row]
                mainGlobalArray.storyText = []
                mainGlobalArray.storyImage = []
                findStory()
        }
        }
    }
    
    @objc func findStory()
    {
        var resText = Array<NSString>()
        var resImages = Array<NSString>()
        
        let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        //let myRequest = NSFetchRequest(entityName: "StoryArray")
        
        let myRequest: NSFetchRequest<NSFetchRequestResult> = StoryArray.fetchRequest()

        let sortDescriptor = NSSortDescriptor(key: "storyName", ascending: true)
        //let sortDescriptors = [sortDescriptor]
        myRequest.sortDescriptors = [sortDescriptor]
        myRequest.returnsObjectsAsFaults = false
        
        let results:NSArray = try! context.fetch(myRequest) as NSArray
        
        if storySearch.pathExtension == "mp4"
        {
            let labelString = storySearch
            let mainBundlePath = Bundle.main.bundlePath
            //print("mainBundlePath = \(mainBundlePath)")
            let fullPath2 = URL(fileURLWithPath: mainBundlePath).appendingPathComponent(labelString as String)
            //print("Full Path - \(fullPath2)")
           // var url: NSURL = NSURL(string: fullPath2.absoluteString)!
            movieString = fullPath2.path as NSString
            self.performSegue(withIdentifier: "playMovie2", sender: self)
            
        }
        else if storySearch == "None"
        {
            let storyString = "Go to settings to add a support to this image."
            let action : UIAlertController = UIAlertController(title: "There is no support identified for this image.", message: storyString, preferredStyle: UIAlertControllerStyle.alert)
            
            action.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { alertAction in
                action.dismiss(animated: true, completion: nil)
            }))
            self.present(action, animated: true, completion: nil)
        }
    
        else
        {
            
        for (index, _) in results.enumerated() {
            let i = Int(index)
            let storyName = (results[i] as AnyObject).value(forKey: "storyName") as! String
            //print("Looking for the story... the index is \(i) and the story's name is \(storyName)")

            if storyName == storySearch as String{
                resText = (results[i] as AnyObject).value(forKey: "storyText") as! Array
                resImages = (results[i] as AnyObject).value(forKey: "storyImages") as! Array
                //print("Text array: \(resText)")
                // //NSLog("Trying to send notification")
                mainGlobalArray.storyText = resText as NSArray
                mainGlobalArray.storyImage = resImages as NSArray
                mainGlobalArray.createStory = false
                self.performSegue(withIdentifier: "storySegue2", sender: self)
            }
            }
            
        }
}

    
    override func prepare(for segue: (UIStoryboardSegue!), sender: Any!)
    {
        if segue.identifier == "playMovie2"{
            let vc = segue.destination as! MoviePlayerViewController
            vc.urlString = movieString as String
            //print("The string being sent to the movie controller from the view controller is \(movieString)")
            
            
            
            ////println("urlString in Table View: \(vc.urlString)")
        }
        /*if segue.identifier == "moveToGame"{
            //NSLog("Move to game segue")
            //HideOptionsView()
            let GameController = segue.destinationViewController as! GameViewController
            GameController.theScheduleCount = scheduleCount
            GameController.theGameState = gameState
            
        }*/
        if segue.identifier == "timerView"{
            ////NSLog("Move to timerView with timerImageString = %@", timerImageString)
            let TV = segue.destination as! TimerViewController
            TV.timerViewImageString = timerImageString
            TV.nexttimerViewImageString = nexttimerImageString
            TV.timerTime = timerTime
        }
        if segue.identifier == "loadTableView"{
            //print("loadTableView segue")
        }
        if segue.identifier == "loadSave"{
            //print("loadSave segue")
        }
        if segue.identifier == "infoPopover"{
            //print("infoPopover segue")
        }
        if segue.identifier == "SettingsSegue"{
            ////println("SettingsSegue segue with image \(settingsImageString)")
            let Settings = segue.destination as! SettingsController
            Settings.settingsTag = setTag
        }
        if segue.identifier == "segueGlobalTimerPopover"{
            // let timer = segue.destination as! GlobalTimer

        }

        else
        {
            
        }
    
    }

   /* @IBAction func longPress(recognizer:UILongPressGestureRecognizer) {
        topCollectionView!.reloadData()
        
        let collectionPoint = recognizer.locationInView(topCollectionView)
        settingsImageString = ""
        
        //println("go to settings?  Timer Bool = \(timerBool)")
        for (index, value) in enumerate(cellLocations) {
            let i = Int(index)
            let j = Int(i+1)
            //println("Item \(index): \(value)")
            let cellFrame :CGRect = value.CGRectValue()
            if CGRectContainsPoint(cellFrame, collectionPoint)
            {
                
                    //println("The index is \([i]) and the image selected is \(cellNames[i])")
                    settingsImageString = cellNames[i] as String
                    settingstimerCF = scheduleTimes[i]
                settingsSupportString = scheduleSupport[i]
                selectedIndex = i
                    self.performSegueWithIdentifier("SettingsSegue", sender: self)
                    /*var action : UIAlertController = UIAlertController(title: "Delete schedule item?", message: "Are you sure that you would like to delete this item?", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    action.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.Default, handler: { alertAction in
                       // ////println("Yes CLICKED")
                        action.dismissViewControllerAnimated(true, completion: nil)
                        images2.removeAtIndex(i)
                        scheduleTimes.removeAtIndex(i)
                        self.topCollectionView!.reloadData()
                        }))
                    
                    action.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default, handler: { alertAction in
                       ////println("No CLICKED")
                        action.dismissViewControllerAnimated(true, completion: nil)
                        }))
                    
                    
                    self.presentViewController(action, animated: true, completion: nil)
                    recognizer.enabled = false*/
                    
                }
        recognizer.enabled = true
        }
       
    }
*/
    @IBAction func loadScheduleBtn(_ sender: AnyObject) {
        
        let appDel:AppDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext
        
        //let myRequest = NSFetchRequest(entityName: "SavedArray")
        let myRequest: NSFetchRequest<NSFetchRequestResult> = SavedArray.fetchRequest()

        myRequest.returnsObjectsAsFaults = false
        myRequest.predicate = NSPredicate(format:"name = %@", "test")
        
        let results:NSArray = try! context.fetch(myRequest) as NSArray

        if(results.count > 0){
            //var res = results[0] as! NSManagedObject
            //images2 = res.valueForKey("array") as Array
            images2 = results as! Array
            mainGlobalArray.tempImages2 = images2
            for _ in images2{
                scheduleTimes.append(0)
                scheduleSupport.append("")
            }
            topCollectionView!.reloadData()
            scheduleCount = 0
        }
        else{
           // ////println("Tried to load, results not > 0")
        }
        
    }
    
    @objc func reloadTopCollectionView(){
        images2 = mainGlobalArray.tempImages2
       //print("Images2: /(images2")  
        topCollectionView!.reloadData()
        scheduleCount = 0

    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [AnyHashable: Any]!){
        let selectedImage: UIImage = image
      ////println("i've got an image: \(selectedImage)")
        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let manager = FileManager.default
        //if var paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
        if var paths = Optional(NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)){
        
            if paths.count > 0 {
                //if let Optional(dirPath = paths[0] as String ){
                    if let dirPath = Optional(paths[0] as String){
                    //let readPath = NSURL(fileURLWithPath: dirPath).URLByAppendingPathComponent("Image.png")
                    //let image = UIImage(named: readPath)
                 //   ////println("selectedImage name: \(selectedImage)")
                   //selectedImage = UIImage(named: readPath)
                    let randomNumber = arc4random()
                    let imageName = "inc_custom_\(randomNumber).png"
                    let writePath = URL(fileURLWithPath: dirPath).appendingPathComponent(imageName)
                    //var theWritePath = writePath.absoluteString
               //     ////println("Path \(writePath)")
                    try? UIImagePNGRepresentation(selectedImage)!.write(to: URL(fileURLWithPath: writePath.absoluteString), options: [.atomic])
                    getImages(self)
                    bottomCollectionView?.reloadData()
                   
                    
                    fileExists = manager.fileExists(atPath: writePath.absoluteString)
                        

                }
            }
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func doWeHaveAFile(){
        if fileExists{
            
            let action : UIAlertController = UIAlertController(title: "Success", message: "The image you selected has been added and is available to be added to the schedule", preferredStyle: UIAlertControllerStyle.alert)
            
            action.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { alertAction in
               // ////println("Yes CLICKED")
                action.dismiss(animated: true, completion: nil)
                }))
            self.present(action, animated: true, completion: nil)
        }
        else
        {
            ////println("File Not There!")
        }
    }
    
 

    @IBAction func movieButtonPressed(_ sender: AnyObject) {
        //print("moviebutton")
        //HideOptionsView()
    }
    @IBAction func moveOptionsView(_ sender: AnyObject) {
        let thePoint = CGPoint(x: 510, y: 633)
        if self.OptionsView.frame.contains(thePoint) {
            //print("moveOptionsView - Hide")
            //HideOptionsView()
            
        }
        else{
            //ShowOptionsView()
    }
    }
    /*func startJiggling() {
        let leftWobble = CGAffineTransformMakeRotation(-10)
        let rightWobble = CGAffineTransformMakeRotation(10)

    }*/

    @IBAction func cancelToMainViewController(_ segue:UIStoryboardSegue) {
        
    }
    @IBAction func startGlobalTimerSegue(_ segue:UIStoryboardSegue) {
        //print("startGlobalTimerSegue")
        if theGlobalTimer.isValid{
                theGlobalTimer.invalidate()
                setProgress = 0.0
                time = 0
                increment = 0
                progress.setProgress(0, animated: true)
                globalTimerLabel.text = "00:00"
                let resetProgress = Float(0.0)
                progress.setProgress(resetProgress, animated: true)
        }
        
        mainGlobalArray.globaltimerplay = true
        timeForTimer = Int(mainGlobalArray.globaltimer)
        progress.trackTintColor = UIColor.green

        //print("Global Timer Bool = \(mainGlobalArray.globaltimerplay) & global timer = \(mainGlobalArray.globaltimer)")
                globalTimer()
                globalTimerIncrement()
        UIApplication.shared.isIdleTimerDisabled = true // Turn off sleep mode

        
    }
    @IBAction func stopGlobalTimerSegue(_ segue:UIStoryboardSegue) {
        //print("stopGlobalTimerSegue")
        globalTimer()
        if theGlobalTimer.isValid{
            theGlobalTimer.invalidate()
            mainGlobalArray.globalTimerStartValue = 0
            mainGlobalArray.globaltimer = 0
            time = 0
            increment = 0
            setProgress = 0.0
            progress.setProgress(0, animated: true)
            globalTimerLabel.text = "00:00"
            let resetProgress = Float(0.0)
            progress.setProgress(resetProgress, animated: true)
            UIApplication.shared.isIdleTimerDisabled = false // Turn

        }
        

    }
    @IBAction func saveSettings(_ segue:UIStoryboardSegue) {
        scheduleTimes[selectedIndex] = settingsScheduleTimesReturn
        scheduleSupport[selectedIndex] = settingsScheduleSupportReturn as String as String as NSString
        topCollectionView?.reloadData()
    }
    @IBAction func deleteScheduleItem(_ segue:UIStoryboardSegue) {
        images2.remove(at: selectedIndex)
        scheduleTimes.remove(at: selectedIndex)
        scheduleSupport.remove(at: selectedIndex)
        //NSLog("The are %i images in the array",images2.count)
        topCollectionView!.reloadData()
    }

    @objc func globalTimer() {
        //print("globalTimer with \(mainGlobalArray.globaltimer)")
        let minutes = Int(mainGlobalArray.globaltimer) / 60
        let minAsSeconds = minutes * 60
        var timerInt = Int()
           timerInt = Int(mainGlobalArray.globaltimer)
        seconds = timerInt - minAsSeconds
        strMinutes = minutes > 9 ? String(minutes): "0" + String(minutes)
        strSeconds = seconds > 9 ? String(seconds): "0" + String(seconds)
        globalTimerLabel.text = "\(strMinutes):\(strSeconds)"
        
    }
    @objc func globalTimerIncrement() {
        //print("globalTimerIncrement - globaltimer = \(mainGlobalArray.globaltimer)")
        let lessOneSecond = mainGlobalArray.globalTimerStartValue - 1
        increment = 1 / lessOneSecond
        //print("Increment \(increment) & increment as Float = \(Float(increment))")
        theGlobalTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer(){
        //print("Update Timer - the progress is \(progress.progress)")
        time = time + 1
        mainGlobalArray.globaltimer = mainGlobalArray.globaltimer - 1
       
        print("Timer = \(time) Global Timer = \(mainGlobalArray.globaltimer) Increment = \(increment)")
       
        setProgress = setProgress + increment
        progress.setProgress(setProgress, animated: true)
        globalTimer()
        //print("Increment is \(increment) & setProgress \(setProgress) & Progress = \(progress.progress)")
        
        if setProgress > 0.75{
            progress.trackTintColor = UIColor.yellow
        }
        if setProgress > 0.90 {
            progress.trackTintColor = UIColor.red
        }
        if time == Int(mainGlobalArray.globalTimerStartValue) {
            //print("Timer Done progress is \(progress.progress)")
            theGlobalTimer.invalidate()
            let resetProgress = Float(0.0)
            setProgress = 0.0
            progress.setProgress(resetProgress, animated: true)
            //print("Reset - progress is \(progress.progress)")
            progress.trackTintColor = UIColor.red
            time = 0
            globalTimerLabel.text = "Timer Finished"
            
            
            UIApplication.shared.isIdleTimerDisabled = false // Turn


        }
    }

  /*  @IBAction func breakButton(sender: AnyObject) {
        print("BreakButton breakBiewBlur is \(breakViewBlur.hidden)")
        
        if breakViewBlur.hidden == true
        {
            print("view is hidden unhide")
        breakViewBlur.hidden = false
            button1.hidden = false
            button5.hidden = false
            button10.hidden = false
            breakButton.setTitle("Done", forState: UIControlState.Normal)
            theBreakTimer.invalidate()
            breakProgressView.progress = 0.0
            breakTime = 0
            breaktimerinc = 0   
        }
        else
        {
            print("view is showing hide")
            breakViewBlur.hidden = true
             breakButton.setTitle("Break", forState: UIControlState.Normal)
        }

    }
    

    @IBAction func setBreakTime(sender: UIButton) {
        
        print("The button is \(sender.titleLabel?.text)")
        let breaktime = Int((sender.titleLabel?.text)!)
        let breakinseconds = Float(breaktime!*60)
        print("breaktime = \(breakinseconds)")
        //print("test time = \(1.0breakinseconds)")
        breaktimerinc = Float(1.0/breakinseconds)
        print("break inc = \(breaktimerinc)")
        breakProgressView.progress = 0.0
        breakTime = 0
        button1.hidden = true
        button5.hidden = true
        button10.hidden = true
        breakTimer()
    }
    func breakTimer(){
        theBreakTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateBreakTimer", userInfo: nil, repeats: true)
    }
    func updateBreakTimer(){
       breakTime = breakTime + breaktimerinc
        breakProgressView.progress = breakTime
        print("progress = \(breakProgressView.progress)")
        if breakProgressView.progress == 1.0{
            theBreakTimer.invalidate()
            
            breakButton.setTitle("Break", forState: UIControlState.Normal)
            breakProgressView.progress = 0.0
             breakViewBlur.hidden = true
            
        }
    }
*/
    @objc func globalTimerButton(_ status:Bool){
        if theGlobalTimer.isValid {
            theGlobalTimer.invalidate()
            breakTime = 0
        }
    }
    @IBAction func globalTimerButtonPressed(_ sender: UIButton) {
       //print("button pressed...")
        }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (UIViewControllerTransitionCoordinatorContext) -> Void in
            
            let orient = UIApplication.shared.statusBarOrientation
            
            switch orient {
            case .portrait:
                print("Portrait")
                orientation = "Portrait"
                self.topCollectionView!.reloadData()
                print("Height = \(self.view.frame.height) - Width =\(self.view.frame.width)")
                // Do something
            default:
                print("Anything But Portrait")
                orientation = "Landscape"
                self.topCollectionView!.reloadData()
                print("Height = \(self.view.frame.height) - Width =\(self.view.frame.width)")
                // Do something else
            }
            
            }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
                print("rotation completed")
        })
        
        super.viewWillTransition(to: size, with: coordinator)
    }
}






