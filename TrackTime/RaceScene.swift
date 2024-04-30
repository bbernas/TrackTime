//
//  RaceScene.swift
//  TrackTime
//
//  Created by brady on 3/21/24.
//
import SpriteKit
import GameplayKit

class RaceScene: SKScene {
    
    private var character : SKSpriteNode?
    private var characterTextures:[SKTexture] = [SKTexture(imageNamed: "frame1"), SKTexture(imageNamed: "frame2"), SKTexture(imageNamed: "frame3")]
    
    private var op : SKSpriteNode?
    private var opTextures:[SKTexture] = [SKTexture(imageNamed: "cframe1"), SKTexture(imageNamed: "cframe2"), SKTexture(imageNamed: "cframe3")]
    
    private var result : SKSpriteNode?
    
    private var racer1 = RunnerSprite()
    
    private var weather = ["sunny", "normal", "rainy", "snowy"]
    
    override func didMove(to view: SKView) {
        self.character = self.childNode(withName: "//character") as? SKSpriteNode
        self.op = self.childNode(withName: "//op") as? SKSpriteNode
        self.result = self.childNode(withName: "//result") as? SKSpriteNode

        racer1.setEner(number: (player.getEner() + Int.random(in: -5...5)))
        racer1.setStam(number: (player.getStam() + Int.random(in: -5...5)))
        
        let effect = weather[Int.random(in: 0..<4)]
        if(effect == "sunny"){
            player.setEner(number: player.getEner() + 10)
        } else if(effect == "rainy"){
            player.setEner(number: player.getEner() - 10)
        } else if(effect == "snowy"){
            player.setEner(number: player.getEner() - 15)
            player.setStam(number: player.getStam() - 10)
        }
        
    }
        
    func showMap(){
        let mapScene = SKScene(fileNamed: "MapScene")
        mapScene?.scaleMode = .aspectFit
        view!.presentScene(mapScene!, transition: SKTransition.crossFade(withDuration: 2))
    }
        
    func startRace(){
        let animation = SKAction.animate(with: characterTextures, timePerFrame: 0.15)
        let animationRepeat = SKAction.repeat(animation, count: 3)

        let animation1 = SKAction.animate(with: opTextures, timePerFrame: 0.15)
        let animationRepeat1 = SKAction.repeat(animation1, count: 3)
        
        //player wins
        if(player.getStam() + player.getEner() > racer1.getStam() + racer1.getEner()){
            character!.run(animationRepeat)
            character!.run(SKAction.moveTo(x: 300, duration: animation.duration * 2))
            
            op!.run(animationRepeat1)
            op!.run(SKAction.moveTo(x: 300, duration: animation.duration * 3))
            
            result?.texture = SKTexture(imageNamed: "win")
            let fadeIn = SKAction.fadeAlpha(to: 1.0, duration: 7.0)
            result!.run(fadeIn)
            
        }
        //opponent wins
        if(player.getStam() + player.getEner() < racer1.getStam() + racer1.getEner()){
            character!.run(animationRepeat)
            character!.run(SKAction.moveTo(x: 300, duration: animation.duration * 3))
            
            op!.run(animationRepeat1)
            op!.run(SKAction.moveTo(x: 300, duration: animation.duration * 2))
            
            result?.texture = SKTexture(imageNamed: "lose")
            let fadeIn = SKAction.fadeAlpha(to: 1.0, duration: 7.0)
            result!.run(fadeIn)
        }
        //ties
        if(player.getStam() + player.getEner() == racer1.getStam() + racer1.getEner()){
            character!.run(animationRepeat)
            character!.run(SKAction.moveTo(x: 300, duration: animation.duration * 3))
            
            op!.run(animationRepeat1)
            op!.run(SKAction.moveTo(x: 300, duration: animation.duration * 3))
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.location(in: self)
            let touchedNode = self.nodes(at: touchLocation)
            for node in touchedNode {
                if(node.name == "map icon"){
                    showMap()
                }
                if(node.name == "startButton"){
                    startRace()
                    
                }
            }
        }
    }
    override func update(_ currentTime: TimeInterval) {
            // Called before each frame is rendered
    }
        
}
    

