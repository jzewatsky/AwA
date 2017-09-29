//
//  OptionsCollectionViewCell.swift
//  MyAwA
//
//  Created by Athletes with Autism on 8/8/15.
//  Copyright (c) 2015 Athletes with Autism. All rights reserved.
//

import UIKit
import Foundation
import AVKit


class OptionsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView?
    
    @IBOutlet weak var leftArrow: UIButton!

    @IBOutlet weak var rightArrow: UIButton!
    
    
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
