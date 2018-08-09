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
    
    var canMove = false
    var leftToMoveLeft = true
    var rightCarToMoveRight = true
    
    var leftCarAtRight = false
    var rightCarAtLeft = false
    var centerPoint: CGFloat!
    
    let leftCarMinimumX : CGFloat = -275
    let leftCarMaximumX : CGFloat = -100
    
    let rightCarMinimumX: CGFloat = 100
    let rightCarMaximumX : CGFloat = 275
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        setUp()
        //createRoadStrip()
        print(UIScreen.main.bounds.width)
        print(UIScreen.main.bounds.height)
        Timer.scheduledTimer(timeInterval: TimeInterval(0.1), target: self, selector: #selector(createRoadStrip), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: TimeInterval(Helper().randomBetweenTwoNumbers(firstNumber: 0, secondNumber: 1.8)), target: self, selector: #selector(leftTraffic), userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: TimeInterval(Helper().randomBetweenTwoNumbers(firstNumber: 0, secondNumber: 1.8)), target: self, selector: #selector(rightTraffic), userInfo: nil, repeats: true)
    }
    
    override func update(_ currentTime: TimeInterval) {
        if canMove {
            move(leftSide: leftToMoveLeft)
            moveRightCar(rightSide: rightCarToMoveRight)
        }
        showRoadStrip()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            if touchLocation.x > centerPoint {
                if rightCarAtLeft {
                    rightCarAtLeft = false
                    rightCarToMoveRight = true
                } else {
                    rightCarAtLeft = true
                    rightCarToMoveRight = false
                }
            } else {
                if leftCarAtRight {
                    leftCarAtRight = false
                    leftToMoveLeft = true
                } else {
                    leftCarAtRight = true
                    leftToMoveLeft = false
                }
            }
            canMove = true
            
            
        }
    }
    
    func setUp() {
        leftCar = self.childNode(withName: "leftCar") as! SKSpriteNode
        rightCar = self.childNode(withName: "rightCar") as! SKSpriteNode
        centerPoint = self.frame.size.width / self.frame.size.height
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
        
        enumerateChildNodes(withName: "orangeCar") { (leftCar, stop) in
            let car = leftCar as! SKSpriteNode
            
            car.position.y -= 30
        }
        
        enumerateChildNodes(withName: "greenCar") { (rightCar, stop) in
            let car = rightCar as! SKSpriteNode
            
            car.position.y -= 30
        }
        
    }
    
    func removeItems() {
        for child in children {
            // children = all nodes in the scene
            if child.position.y < -self.size.height - 100 {
                child.removeFromParent()
            }
        }
    }
    
    func move(leftSide: Bool) {
        if leftSide {
            leftCar.position.x -= 20
            if leftCar.position.x < leftCarMinimumX {
                leftCar.position.x = leftCarMinimumX
            }
        } else {
            leftCar.position.x += 20
            if leftCar.position.x > leftCarMaximumX {
                leftCar.position.x = leftCarMaximumX
            }
        }
    }
    
    func moveRightCar(rightSide: Bool) {
        if rightSide {
            rightCar.position.x += 20
            if rightCar.position.x > rightCarMaximumX {
                rightCar.position.x = rightCarMaximumX
            }
        } else {
            rightCar.position.x -= 20
            if rightCar.position.x < rightCarMinimumX {
                rightCar.position.x = rightCarMinimumX
            }
        }
    }
    
    @objc func leftTraffic() {
        
        let leftTrafficItem: SKSpriteNode!
        let randomNumber = Helper().randomBetweenTwoNumbers(firstNumber: 1, secondNumber: 8)
        switch Int(randomNumber) {
        case 1...4:
            leftTrafficItem = SKSpriteNode(imageNamed: "orangeCar")
            leftTrafficItem.name = "orangeCar"
            break
        case 5...8:
            leftTrafficItem = SKSpriteNode(imageNamed: "greenCar")
            leftTrafficItem.name = "greenCar"
            break
        default:
            leftTrafficItem = SKSpriteNode(imageNamed: "orangeCar")
            leftTrafficItem.name = "orangeCar"
        }
        leftTrafficItem.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        leftTrafficItem.zPosition = 5
        let randomNumber2 = Helper().randomBetweenTwoNumbers(firstNumber: 1, secondNumber: 10)
        switch randomNumber2 {
        case 1...4:
            leftTrafficItem.position.x = -280
            break
        case 5...10:
            leftTrafficItem.position.x = -100
            break
        default:
            leftTrafficItem.position.x = -280
        }
        leftTrafficItem.position.y = 700
        addChild(leftTrafficItem)
        
    }
    
    @objc func rightTraffic() {
        
        let rightTrafficItem: SKSpriteNode!
        let randomNumber = Helper().randomBetweenTwoNumbers(firstNumber: 1, secondNumber: 8)
        switch Int(randomNumber) {
        case 1...4:
            rightTrafficItem = SKSpriteNode(imageNamed: "orangeCar")
            rightTrafficItem.name = "orangeCar"
            break
        case 5...8:
            rightTrafficItem = SKSpriteNode(imageNamed: "greenCar")
            rightTrafficItem.name = "greenCar"
            break
        default:
            rightTrafficItem = SKSpriteNode(imageNamed: "orangeCar")
            rightTrafficItem.name = "orangeCar"
        }
        rightTrafficItem.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        rightTrafficItem.zPosition = 5
        let randomNumber2 = Helper().randomBetweenTwoNumbers(firstNumber: 1, secondNumber: 10)
        switch randomNumber2 {
        case 1...4:
            rightTrafficItem.position.x = 280
            break
        case 5...10:
            rightTrafficItem.position.x = 100
            break
        default:
            rightTrafficItem.position.x = 280
        }
        rightTrafficItem.position.y = 700
        addChild(rightTrafficItem)
        
    }
    
    
  
}
