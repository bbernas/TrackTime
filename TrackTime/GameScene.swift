//
//  GameScene.swift
//  TrackTime
//
//  Created by brady on 1/29/24.
//

import SpriteKit
import GameplayKit
//var player = RunnerSprite()

class GameScene: SKScene {
    private var character : SKSpriteNode?
    private var characterTextures:[SKTexture] = []
    
    private var ebar : SKSpriteNode?
    private var sbar : SKSpriteNode?
    
    private var cloud : SKSpriteNode?
    private var bed : SKSpriteNode?
    
    override func didMove(to view: SKView) {
        self.character = self.childNode(withName: "//character") as? SKSpriteNode
        self.cloud = self.childNode(withName: "//cloud") as? SKSpriteNode
        self.ebar = self.childNode(withName: "//ebar") as? SKSpriteNode
        
        let cloudLeft = SKAction.moveTo(x: -900, duration: 80)
        let cloudRight = SKAction.moveTo(x: 900, duration: 80)
        let cloudMove = SKAction.sequence([cloudLeft,cloudRight])
        cloud!.run(SKAction.repeat(cloudMove, count: 1000))
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
                if(node.name == "bedNode") && (player.getEner() < 100){
                    player.setEner(number: (player.getEner() + 5))
                } else if((node.name == "bedNode") && (player.getEner() == 100)){
                    print("you don't need sleep right now.")
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


