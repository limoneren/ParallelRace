//
//  GameMenu.swift
//  ParallelRace
//
//  Created by Eren Limon on 8/11/18.
//  Copyright © 2018 Eren Limon. All rights reserved.
//

import Foundation
import SpriteKit

class GameMenu: SKScene {
    
    var startGame = SKLabelNode()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        startGame = self.childNode(withName: "startGame") as! SKLabelNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if atPoint(touchLocation).name == "startGame" {
                var gameScene = SKScene(fileNamed: "GameScene")
                gameScene?.scaleMode = .aspectFit
                view?.presentScene(gameScene!, transition: SKTransition.doorsOpenHorizontal(withDuration: TimeInterval(2)))
            }
            
        }
        
    }
    
}
