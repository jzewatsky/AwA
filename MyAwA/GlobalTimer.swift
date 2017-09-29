//
//  GlobalTimer.swift
//  MyAwA
//
//  Created by Athletes with Autism on 9/21/15.
//  Copyright (c) 2015 Athletes with Autism. All rights reserved.
//
//  

import Foundation
import CoreData
import UIKit


class GlobalTimer: UIViewController{
    
    @IBOutlet var GlobalTimerLabel: UILabel!
    
    @IBOutlet var GlobalTimerSlider: UISlider!
    
    override func viewDidLoad() {
    GlobalTimerSlider.value = Float(mainGlobalArray.globaltimer) / 60
        sliderChanged(GlobalTimerSlider)
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        //println("\(GlobalTimerSlider.value)")

        //let minutes = Int(GlobalTimerSlider.value / 60)
        //let minAsSeconds = GlobalTimerSlider.value * 60
        seconds = 0
        strMinutes = GlobalTimerSlider.value > 9 ? String(minutes): "0" + String(minutes)
        strSeconds = seconds > 9 ? String(seconds): "0" + String(seconds)
        GlobalTimerLabel.text = "\(Int(round(GlobalTimerSlider.value))):00"
        mainGlobalArray.globaltimer = round(GlobalTimerSlider.value) * 60
        mainGlobalArray.globalTimerStartValue = round(GlobalTimerSlider.value) * 60
    }
   /* @IBAction func stopGlobalTimerSegue(segue: UIStoryboardSegue) {

    }
    @IBAction func startGlobalTimerSegue(segue: UIStoryboardSegue) {
        

    }
    @IBAction func startTimer(sender: UIButton) {
       mainGlobalArray.globaltimerplay = true
        self.performSegueWithIdentifier("startGlobalTimerSegue", sender: self)
        
    }
    @IBAction func stopTimer(sender: UIButton) {
        mainGlobalArray.globaltimerplay = false

        self.performSegueWithIdentifier("stopGlobalTimerSegue", sender: self)
        

      
    }
*/
    override func prepare(for segue: (UIStoryboardSegue!), sender: Any!)
    {
        if segue.identifier == "stopGlobalTimerSegue"{
            print("stopGlobalTimer segue in GlobalTimer fired")

        }
        if segue.identifier == "startGlobalTimerSegue"{
            print("startGlobalTimer segue in GlobalTimer fired")

            
        }
    }
        
        
}

    

