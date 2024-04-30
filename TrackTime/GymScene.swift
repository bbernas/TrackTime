//
//  GymScene.swift
//  TrackTime
//
//  Created by brady on 2/7/24.
//

import SpriteKit
import GameplayKit

class GymScene: SKScene {
    
    private var character : SKSpriteNode?
    private var characterTextures:[SKTexture] = []
    
    private var treadmill : SKSpriteNode?
    private var ebar : SKSpriteNode?
    private var sbar : SKSpriteNode?
    
    //public var player = StartScene().player

    override func didMove(to view: SKView) {
        self.character = self.childNode(withName: "//character") as? SKSpriteNode
        self.ebar = self.childNode(withName: "//ebar") as? SKSpriteNode
        self.sbar = self.childNode(withName: "//sbar") as? SKSpriteNode
    }
    
    func showMap(){
        let mapScene = SKScene(fileNamed: "MapScene")
        mapScene?.scaleMode = .aspectFit
        view!.presentScene(mapScene!, transition: SKTransition.crossFade(withDuration: 2))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        characterTextures = [SKTexture(imageNamed: "frame1"), SKTexture(imageNamed: "frame2"), SKTexture(imageNamed: "frame3")]
        
        let animation = SKAction.animate(with: characterTextures, timePerFrame: 0.15)
        let animationRepeat = SKAction.repeat(animation, count: 3)
        
        for touch in touches{
            let touchLocation = touch.location(in: self)
            let touchedNode = self.nodes(at: touchLocation)
            for node in touchedNode {
                if((node.name == "treadmill") && (player.getStam() < 100)) && (player.getEner() > 0){
                    player.setEner(number: (player.getEner() - 10))
                    player.setStam(number: (player.getStam() + 5))
                    mainClock.addTime(number: 1)
                } else if((node.name == "treadmill") && (player.getStam() >= 100)){
                    print("Training Level is Max")
                    //for future add popup showing training max
                }
                if(node.name == "map icon"){
                    showMap()
                }
                if((touchLocation.y < -210 && touchLocation.y > -630) && (touchLocation.x > -355 && touchLocation.x < 350)){
                    character!.run(animationRepeat)
                    character!.run(SKAction.moveTo(y: touchLocation.y, duration: animation.duration * 3))
                    character!.run(SKAction.moveTo(x: touchLocation.x, duration: animation.duration * 3))
                }
            }
            
        }
    }
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        let x = player.getEner()
        //player.setEner(number: Int.random(in: 0..<101))
        if(x > 75){
            ebar?.texture = SKTexture(imageNamed: "bar4")
        } else if(x > 50){
            ebar?.texture = SKTexture(imageNamed: "bar3")
        } else if(x > 25){
            ebar?.texture = SKTexture(imageNamed: "bar2")
        } else if(x > 0){
            ebar?.texture = SKTexture(imageNamed: "bar1")
        } else {
            ebar?.texture = SKTexture(imageNamed: "bar0")
        }
        
        let y = player.getStam()
        if(y > 75){
            sbar?.texture = SKTexture(imageNamed: "bar4")
        } else if(y > 50){
            sbar?.texture = SKTexture(imageNamed: "bar3")
        } else if(y > 25){
            sbar?.texture = SKTexture(imageNamed: "bar2")
        } else if(y > 0){
            sbar?.texture = SKTexture(imageNamed: "bar1")
        } else {
            sbar?.texture = SKTexture(imageNamed: "bar0")
        }
    }

}
