//
//  addStoryCollectionViewCell.swift
//  MyAwA
//
//  Created by Athletes with Autism on 11/12/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//

import UIKit

class addStoryCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var imageAdd: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func didMoveToSuperview() {
        
        layoutIfNeeded()
    }
    @objc func startJiggling()
    {
 //print("startJiggling was fired")
        
        let fullRotation = CGFloat(CGFloat.pi * 2)
        
        UIView.animate(withDuration: 1.0, animations: {
            // animating `transform` allows us to change 2D geometry of the object
            // like `scale`, `rotation` or `translate`
            self.transform = CGAffineTransform(rotationAngle: fullRotation)
        })

        
        let duration = 2.0
        let delay = 0.0
        let options = UIViewKeyframeAnimationOptions()
        
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: options, animations: {
            // each keyframe needs to be added here
            // within each keyframe the relativeStartTime and relativeDuration need to be values between 0.0 and 1.0
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3, animations: {
                // start at 0.00s (5s × 0)
                // duration 1.67s (5s × 1/3)
                // end at   1.67s (0.00s + 1.67s)
                self.transform = CGAffineTransform(rotationAngle: 1/3 * fullRotation)
            })
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3, animations: {
                self.transform = CGAffineTransform(rotationAngle: 2/3 * fullRotation)
            })
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3, animations: {
                self.transform = CGAffineTransform(rotationAngle: 3/3 * fullRotation)
            })
            
            }, completion: {finished in
                // any code entered here will be applied
                // once the animation has completed
                
        })
    }

    
}
