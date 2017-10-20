//
//  timerView.swift
//  MyAwA
//
//  Created by Athletes with Autism on 9/20/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//

import CoreData
import QuartzCore
import GLKit
import Foundation


class TimerViewController: UIViewController{
    @objc var timerViewImageString = String()
    @objc var nexttimerViewImageString = String()
    @objc var timerTime = Int()
    @objc var path = UIBezierPath()
    @objc var time = Double()
    @objc var linew = CGFloat()
    @objc var timer = Timer()
    @objc var aSwitch = String("A")
    @objc var newTimerViewImage = UIImageView()
    @IBOutlet weak var timerDoneLabel: UILabel!
    @objc let ovalEndAngle = CGFloat(270 * M_PI/180)
    @IBOutlet weak var timerViewImage: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startTimer: UIButton!
    @IBOutlet weak var timerStepper: UIStepper!

 
    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
    NSLog("TimerView - vierDidLoad")
        
    
        self.preferredContentSize = CGSize(width: 280,height: 360)
        

        newTimerViewImage.image = UIImage(named: nexttimerViewImageString)
        

        
        timerViewImage.image = UIImage(named: timerViewImageString)
        
    timerDoneLabel.isHidden = true
        time = Double(timerTime)
        timerStepper.value = time 
        minutes = Int(time / 60)
        minAsSeconds = minutes * 60
        seconds = Int(time) - minAsSeconds
        strMinutes = minutes > 9 ? String(minutes): "0" + String(minutes)
        strSeconds = seconds > 9 ? String(seconds): "0" + String(seconds)
        timerLabel.text = "\(strMinutes):\(strSeconds)"
    }
    
    @IBAction func timerStart(_ sender: AnyObject) {
                // set up some values to use in the curve
        let progressLine = CAShapeLayer()
        let ovalStartAngle = CGFloat(270.01 * M_PI/180)
        timerDoneLabel.isHidden = true
        let ovalRect = timerViewImage.frame
        
        // create the bezier path
        let ovalPath = UIBezierPath()
        var rad = ovalRect.width / 2
        linew = ovalRect.width / 2
        let halflinew = linew / 2
        rad = rad - halflinew
        ovalPath.addArc(withCenter: CGPoint(x: ovalRect.midX, y: ovalRect.midY),
            radius: rad,
            startAngle: ovalStartAngle,
            endAngle: ovalEndAngle, clockwise: true)
        
        // create an object that represents how the curve
        // should be presented on the screen
        
        progressLine.path = ovalPath.cgPath
        let thestroke = UIColor.red
        progressLine.strokeColor = thestroke.withAlphaComponent(0.5).cgColor
        progressLine.fillColor = UIColor.clear.cgColor
        progressLine.lineWidth = linew
        //progressLine.lineCap = kCALineCapRound
        
        // add the curve to the screen
        self.view.layer.addSublayer(progressLine)
        
        // create a basic animation that animates the value 'strokeEnd'
        // from 0.0 to 1.0 over 3.0 seconds
        let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animateStrokeEnd.duration = time
        animateStrokeEnd.fromValue = 0.0
        animateStrokeEnd.toValue = 1.0
        
        // add the animation
        progressLine.add(animateStrokeEnd, forKey: "animate stroke end animation")
        NSLog("Timer: %i",time)
        timerStepper.isHidden = true
        startTimer.isHidden = true
          timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(TimerViewController.update), userInfo: nil, repeats: true)
    }
    @objc func update() {
        NSLog("Update Time - %i seconds",time)
        time = time - 1
        minutes = Int(time / 60)
        minAsSeconds = minutes * 60
        seconds = Int(time) - minAsSeconds
        strMinutes = minutes > 9 ? String(minutes): "0" + String(minutes)
        strSeconds = seconds > 9 ? String(seconds): "0" + String(seconds)
        timerLabel.text = "\(strMinutes):\(strSeconds)"
        if timerLabel.text == "00:00"{
            NSLog("Timer Complete")
            timer.invalidate()
            timerDoneLabel.isHidden = false
            timerStepper.value = 0
            
                }
            }
    @IBAction func timerStepperChange(_ stepper: UIStepper) {
        
        
        print("The stepper is at \(stepper.value)")
        minutes = Int(stepper.value / 60)
        minAsSeconds = minutes * 60
        seconds = Int(stepper.value) - minAsSeconds
        // //println("\(minutes):\(seconds)")
        strMinutes = minutes > 9 ? String(minutes): "0" + String(minutes)
        strSeconds = seconds > 9 ? String(seconds): "0" + String(seconds)
        time = stepper.value
        timerLabel.text = "\(strMinutes):\(strSeconds)"
    }
 
    
    @IBAction func nowNext(_ sender: AnyObject) {

        
        print("Width is \(self.view.frame.width)")
        if self.view.frame.width > 280{
           print("Second Click")
            
            UIView.animate(withDuration: 1.00, animations: {
                self.nextButton.transform = CGAffineTransform(rotationAngle: 0)
                self.preferredContentSize = CGSize(width: 280,height: 360)
            })
            

        }
        else{
           
            UIView.animate(withDuration: 1.00, animations: {
                self.nextButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                 self.preferredContentSize = CGSize(width: 500,height: 360)
            })
        }
        
        //newTimerViewImage.frame = CGRect(x: 385, y: 20, width: 250, height: 250)
        newTimerViewImage.image = UIImage(named: nexttimerViewImageString)
        
        self.view.addSubview(newTimerViewImage)
        

        
    }
    


}
