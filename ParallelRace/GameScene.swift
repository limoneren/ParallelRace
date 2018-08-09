//
//  GameScene.swift
//  ParallelRace
//
//  Created by Eren Limon on 8/9/18.
//  Copyright © 2018 Eren Limon. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var leftCar = SKSpriteNode()
    var rightCar = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        setUp()
        //createRoadStrip()
        Timer.scheduledTimer(timeInterval: TimeInterval(0.1), target: self, selector: #selector(createRoadStrip), userInfo: nil, repeats: true)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        showRoadStrip()
        
    }
    
    func setUp() {
        leftCar = self.childNode(withName: "leftCar") as! SKSpriteNode
        rightCar = self.childNode(withName: "rightCar") as! SKSpriteNode
        
    }
    
    @objc func createRoadStrip() {
        let leftRoadStrip = SKShapeNode(rectOf: CGSize(width: 10, height: 40))
        leftRoadStrip.strokeColor = SKColor.white
        leftRoadStrip.fillColor = SKColor.white
        leftRoadStrip.alpha = 0.4
        leftRoadStrip.name = "leftRoadStrip"
        leftRoadStrip.zPosition = 5
        leftRoadStrip.position.x = -185
        leftRoadStrip.position.y = 700
        addChild(leftRoadStrip)
        
        let rightRoadStrip = SKShapeNode(rectOf: CGSize(width: 10, height: 40))
        rightRoadStrip.strokeColor = SKColor.white
        rightRoadStrip.fillColor = SKColor.white
        rightRoadStrip.alpha = 0.4
        rightRoadStrip.name = "rightRoadStrip"
        rightRoadStrip.zPosition = 5
        rightRoadStrip.position.x = 185
        rightRoadStrip.position.y = 700
        addChild(rightRoadStrip)
        
    }
    
    func showRoadStrip() {
        
        enumerateChildNodes(withName: "leftRoadStrip") { (roadStrip, stop) in
            let strip = roadStrip as! SKShapeNode
            
            strip.position.y -= 30
        }
        
        enumerateChildNodes(withName: "rightRoadStrip") { (roadStrip, stop) in
            let strip = roadStrip as! SKShapeNode
            
            strip.position.y -= 30
        }
        
    }
    
    
  
}
