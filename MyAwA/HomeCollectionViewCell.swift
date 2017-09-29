//
//  HomeCollectionViewCell.swift
//  MyAwA
//
//  Created by Athletes with Autism on 7/25/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//

import UIKit
import Foundation
import AVKit


class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView2: UIImageView?
    @IBOutlet var imageView: UIImageView?
    
    @IBOutlet weak var imageName: UILabel!
    
    @IBOutlet weak var scheduleLabel: UILabel!
    @IBOutlet weak var storyIcon: UIImageView!

    

    @IBOutlet weak var storyIndicator: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    override func didMoveToSuperview() {
        
        layoutIfNeeded()
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

