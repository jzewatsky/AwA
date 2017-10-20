//
//  MoviePlayerViewController.swift
//  MyAwA
//
//  Created by Athletes with Autism on 8/10/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//
import AVFoundation
import AVKit

class MoviePlayerViewController: AVPlayerViewController {
    @objc let somePlayerViewController = AVPlayerViewController()
    @objc var urlString = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        //println("Movie Player Did Load")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //let labelString: String = "FMSF_Underhand Throw.mp4"
        
        //println("button pressed: \(labelString)")
        //let mainBundlePath = NSBundle.mainBundle().bundlePath
        //let fullPath2 = NSURL(fileURLWithPath: mainBundlePath).URLByAppendingPathComponent(urlString)
        let theURL = URL(fileURLWithPath: urlString)
        let theURLpath = URL(fileURLWithPath: theURL.path)
        print("The string in movie player is: \(urlString)")
        self.player = AVPlayer(url: theURLpath)
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(
            self,
            selector: #selector(MoviePlayerViewController.PlayToEndTime(_:)),
            name:NSNotification.Name.AVPlayerItemDidPlayToEndTime,
            object: self.player!.currentItem
        )
        player!.play()
       

    }

    
    
    @objc func PlayToEndTime (_ sender: AnyObject) {
       // println("Played to end time.")
        self.dismiss(animated: true, completion: nil)
    }
    @objc func didFinishPlaying (_ sender : AnyObject?){
      //  println("Movie Finished Playing.")
    }

    override func viewWillDisappear(_ animated: Bool){
        //println("The View will disappear")
        self.player = nil

        
    }
}
