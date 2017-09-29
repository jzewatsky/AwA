//
//  GameViewController.swift
//  MyAwA
//
//  Created by Athletes with Autism on 9/14/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//

import Foundation
import SpriteKit


class GameViewController: UIViewController {
   var theScheduleCount = Int()
    var theGameState = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = GameScene(size: self.view.bounds.size)
        let skView = self.view as! SKView
        skView.backgroundColor = SKColor(red: 0, green: 0.25, blue: 0, alpha: 1)
        skView.showsFPS = true
        skView.showsNodeCount = true
        scene.physicsWorld.gravity = CGVectorMake(0, -6)
        let physicsBody = SKPhysicsBody (edgeLoopFromRect: skView.frame)
        scene.physicsBody = physicsBody
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit the window */
        scene.scaleMode = .AspectFit
        scene.howMany = theScheduleCount
        scene.game = gameState
        NSLog("ViewController sent the interger %i to GameViewController and howMany = %i",theScheduleCount,scene.howMany)
        skView.presentScene(scene)
        

        
    }
    
}