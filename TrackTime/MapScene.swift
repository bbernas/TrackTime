//
//  MapScene.swift
//  TrackTime
//
//  Created by brady on 2/5/24.
//

import SpriteKit
import GameplayKit

class MapScene: SKScene {

    override func didMove(to view: SKView) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLocation = touch.location(in: self)
            let touchedNode = self.nodes(at: touchLocation)
            for node in touchedNode {
                
                if (node.name == "gymicon") {
                    showGymScene()
                }
                
                if (node.name == "houseicon"){
                    showGameScene()
                }
            }
        }
    }
    
    func showGameScene(){
        let GameScene = SKScene(fileNamed: "GameScene")
        GameScene?.scaleMode = .aspectFit
        view!.presentScene(GameScene!, transition: SKTransition.crossFade(withDuration: 2))
        
    }
    
    func showGymScene(){
        let GymScene = SKScene(fileNamed: "GymScene")
        GymScene?.scaleMode = .aspectFit
        view!.presentScene(GymScene!, transition: SKTransition.crossFade(withDuration: 2))
        
    }
    
    override func update(_ currentTime: TimeInterval) {
            // Called before each frame is rendered
        }
}

