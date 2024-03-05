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

    override func didMove(to view: SKView) {
        self.character = self.childNode(withName: "//character") as? SKSpriteNode
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
            if((touchLocation.y < -210 && touchLocation.y > -630) && (touchLocation.x > -355 && touchLocation.x < 350)){
                character!.run(animationRepeat)
                character!.run(SKAction.moveTo(y: touchLocation.y, duration: animation.duration * 3))
                character!.run(SKAction.moveTo(x: touchLocation.x, duration: animation.duration * 3))
            }
            for node in touchedNode {
                if (node.name == "map icon"){
                    showMap()
                }
            }
        }
    }
}
