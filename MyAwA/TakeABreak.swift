//
//  TakeABreak.swift
//  MyAwA
//
//  Created by Athletes with Autism on 3/3/16.
//  Copyright © 2016 Athletes with Autism. All rights reserved.
//

import Foundation
import CoreData
import UIKit



@IBDesignable
class TakeABreak: UIViewController{

    @IBOutlet weak var TImerUItoTopGuideConstraint: NSLayoutConstraint!
    @IBOutlet weak var ProgressView: UIProgressView!
    

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var SetBreakButton: UIButton!
    
    @IBOutlet weak var button5Min: UIButton!
    @IBOutlet weak var button1Min: UIButton!

    @IBOutlet weak var button3Min: UIButton!
    @IBOutlet weak var timerDoneLabel: UILabel!
    @IBOutlet weak var timerUIView: UIView!
    @objc var time = Double()
    @objc var whatisthefromtime = Double()
    @objc var animationProgress = Double()
    @objc var rotate = Bool(false)
    @objc let ovalEndAngle = CGFloat(270 * Double.pi/180)
    @objc var ovalPath = UIBezierPath()
    @objc var ovalPath2 = UIBezierPath()
    @objc let progressLine = CAShapeLayer()
    @objc let strokeLine = CAShapeLayer()
    @objc let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
    override func viewDidLoad() {
        print("Break View Loaded")
        
        
        
    }

    @IBAction func BreakButtonPressed(_ sender: UIButton) {
        let senderTime = sender.tag
        print("You need a \(senderTime) break")
        timerLabel.isHidden = false
        button1Min.isHidden = true
        button3Min.isHidden = true
        button5Min.isHidden = true
        //TImerUItoTopGuideConstraint.constant = TImerUItoTopGuideConstraint.constant + CGFloat(senderTime)
       
        
        //let increment = view.frame.height / CGFloat(senderTime * 60)

        time = Double(senderTime * 60)
        whatisthefromtime = time
        setupPath()
    }
    
    
@objc func setupPath(){

    /*timer.invalidate()
    progressLine.removeAllAnimations()
    progressLine.removeFromSuperlayer()
    strokeLine.removeAllAnimations()
    strokeLine.removeFromSuperlayer()*/
        // set up some values to use in the curve

        let ovalStartAngle = CGFloat(270.01 * Double.pi/180)
        timerDoneLabel.isHidden = true


            
        let ovalRect = bottomView.frame

        
    
        // create the bezier path


        var rad = CGFloat()
        var linew = CGFloat()
    if bottomView.frame.height >= bottomView.frame.width{
            rad = ovalRect.width / 4
            linew = ovalRect.width / 2
    }
    else{
        rad = ovalRect.height / 4
        linew = ovalRect.height / 2
    }
    
    rad = rad + 2
    //rad = rad - halflinew
        ovalPath.addArc(withCenter: CGPoint(x: ovalRect.midX, y: ovalRect.midY),
            radius: rad,
            startAngle: ovalStartAngle,
            
            endAngle: ovalEndAngle, clockwise: true)
    
    ovalPath2.addArc(withCenter: CGPoint(x: ovalRect.midX, y: ovalRect.midY),
        radius: linew,
        startAngle: ovalStartAngle,
        
        endAngle: ovalEndAngle, clockwise: true)
    
        // create an object that represents how the curve
        // should be presented on the screen
        strokeLine.path = ovalPath2.cgPath
        strokeLine.fillColor = UIColor.green.cgColor
        progressLine.path = ovalPath.cgPath
        let thestroke = UIColor.white
        progressLine.strokeColor = thestroke.withAlphaComponent(1).cgColor
        progressLine.fillColor = UIColor.clear.cgColor
        progressLine.lineWidth = linew
    
        //progressLine.lineCap = kCALineCapRound
        
        // add the curve to the screen

        self.bottomView.layer.addSublayer(strokeLine)
        self.bottomView.layer.addSublayer(progressLine)
    
    
        
        // create a basic animation that animates the value 'strokeEnd'
        // from 0.0 to 1.0 over 3.0 seconds
    
        animateStrokeEnd.duration = time
    
    if rotate == true{
        animateStrokeEnd.fromValue = animationProgress
        print("rotate is true and progress is \(animationProgress)")
    }
    else
    {
        animateStrokeEnd.fromValue = 0.0
    }
        animateStrokeEnd.toValue = 1.0
        
        // add the animation
        progressLine.add(animateStrokeEnd, forKey: "animate stroke end animation")

    rotate = false
        NSLog("Timer: %i",time)

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(TakeABreak.update), userInfo: nil, repeats: true)
        
        
    }
    @objc func update() {

        print("Update Time \(time)seconds")
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
            timerLabel.isHidden = true
            
            

            //timerStepper.value = 0
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    /*override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animateAlongsideTransition({ (UIViewControllerTransitionCoordinatorContext) -> Void in
            
            self.animationProgress = Double(1 - (self.time/self.whatisthefromtime))

            self.rotate = true
            timer.invalidate()
            self.setupPath()
            
            /*self.progressLine.removeAllAnimations()
            
            self.strokeLine.removeAllAnimations()*/
            
            let orient = UIApplication.sharedApplication().statusBarOrientation
            
            switch orient {
            case .Portrait:
                
                
                
                print("Portrait")
                orientation = "Portrait"
                
                
                /*self.strokeLine.removeAllAnimations()
                self.strokeLine.removeFromSuperlayer()
                self.progressLine.removeAllAnimations()
                self.progressLine.removeFromSuperlayer()*/
                //self.setupPath()
                print("Height = \(self.view.frame.height) - Width =\(self.view.frame.width)")
                // Do something
            default:
                print("Anything But Portrait")
                orientation = "Landscape"
                /*self.strokeLine.removeAllAnimations()
                self.strokeLine.removeFromSuperlayer()
                self.progressLine.removeAllAnimations()
                self.progressLine.removeFromSuperlayer()*/
                //self.setupPath()
                print("Height = \(self.view.frame.height) - Width =\(self.view.frame.width)")
                // Do something else
            }
            
            }, completion: { (UIViewControllerTransitionCoordinatorContext) -> Void in
                print("rotation completed")
                
        })
        
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }*/

}
